class Api::V1::ApActivityController < ApplicationController
  include Swagger::ApActivityApi

  before_action :set_ap_specific_goal
  before_action :set_ap_activity, only: [:show, :update, :report_progress]
  before_action :set_ap_general_goal, only: [:report_progress]

  def index
    #Listar todos los convenios
    @ap_activity = @ap_specific_goal.ap_activities
    render json: @ap_activity
  end

  def show
    render json: @ap_activity
  end

  def create
    #byebug
    if ((@ap_specific_goal.ap_activities.sum(:weight) + (params[:ap_activity][:weight])) <= 100)
      @ap_activity = @ap_specific_goal.ap_activities.new(ap_activity_params)
      @ap_activity.completedPercentage = 0
      if @ap_specific_goal.save
        render json: @ap_activity, status: :created
      else
        render json: @ap_activity.errors, status: :unprocessable_entity
      end
    else
      render json: { "error": "Los pesos no pueden sumar mas de 100 puntos" }, status: :not_acceptable
    end
  end

  def update
    if @ap_activity.update(ap_activity_params)
      render json: @ap_activity
    else
      render json: @ap_activity.errors, status: :unprocessable_entity
    end
  end

  def report_progress
    #byebug
    if (@ap_general_goal.ap_specific_goals.sum(:weight) == 100)
      if (@ap_specific_goal.ap_activities.sum(:weight) == 100)
        if (((params[:ap_activity][:completedPercentage]) <= 100))
          if @ap_activity.update(params.require(:ap_activity).permit(:completedPercentage))
            set_ap_specific_goal_progress
            @ap_specific_goal.save
            set_ap_general_goal_progress
            @ap_general_goal.save
            render json: @ap_activity
          else
            render json: @ap_activity.errors, status: :unprocessable_entity
          end
        else
          render json: { "error": "El cumplimiento maximo de la actividad es 100%" }, status: :not_acceptable
        end
      else
        render json: { "error": "EL peso de todas las actividades del objetivo especifico deben sumar 100% antes de agregar progreso la actividad" }, status: :not_acceptable
      end
    else
      render json: { "error": "EL peso de todas los objetivos especificos deben sumar 100% antes de agregar progreso la actividad" }, status: :not_acceptable
    end
  end

  private

  def set_ap_specific_goal_progress
    @ap_specific_goal.completedPercentage = (@ap_specific_goal.ap_activities.map { |n| n.weight * n.completedPercentage }.inject { |sum, x| sum + x } / 100)
  end

  def set_ap_general_goal_progress
    @ap_general_goal.completedPercentage = (@ap_general_goal.ap_specific_goals.map { |n| n.weight * n.completedPercentage }.inject { |sum, x| sum + x } / 100)
  end

  def set_ap_general_goal
    @ap_general_goal = @ap_specific_goal.ap_general_goal
  end

  def set_ap_activity
    @ap_activity = @ap_specific_goal.ap_activities.find_by(id: params[:id])
  end

  def ap_activity_params
    params.require(:ap_activity).permit(:activity, :weight)
  end

  def set_ap_specific_goal
    @ap_specific_goal = ApSpecificGoal.find(params[:ap_specific_goal_id])
  end
end
