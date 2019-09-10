class Api::V1::ApSpecificGoalController < ApplicationController
  include Swagger::ApSpecificGoalApi

  before_action :set_ap_general_goal
  before_action :set_ap_specific_goal, only: [:show, :update, :reportProgress]

  def index
    #Listar todos los convenios
    @ap_specific_goal = @ap_general_goal.ap_specific_goals
    render json: @ap_specific_goal
  end

  def show
    render json: @ap_specific_goal
  end

  def create
    #byebug
    if ((@ap_general_goal.ap_specific_goals.sum(:weight) + (params[:ap_specific_goal][:weight])) <= 100)
      @ap_specific_goal = @ap_general_goal.ap_specific_goals.new(ap_specific_goal_params)
      @ap_specific_goal.completedPercentage = 0
      if @ap_specific_goal.save
        render json: @ap_specific_goal, status: :created
      else
        render json: @ap_specific_goal.errors, status: :unprocessable_entity
      end
    else
      render json: { "error": "Los pesos no pueden sumar mas de 100 puntos" }, status: :not_acceptable
    end
  end

  def update
    if (params[:ap_specific_goal][:weight])
      #if(params[:ap_specific_goal][:weight] ) Se debe validar que sea enviado
      diferenceCashValue = params[:ap_specific_goal][:weight] - @ap_specific_goal.weight
      if (((@ap_general_goal.ap_specific_goals.sum(:weight) + diferenceCashValue) <= 100))
        if @ap_specific_goal.update(ap_specific_goal_params)
          render json: @ap_specific_goal
        else
          render json: @ap_specific_goal.errors, status: :unprocessable_entity
        end
      else
        render json: { "error": "Los pesos no pueden sumar mas de 100 puntos" }, status: :not_acceptable
      end
    else
      if @ap_specific_goal.update(ap_specific_goal_params)
        render json: @ap_specific_goal
      else
        render json: @ap_specific_goal.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def set_ap_specific_goal
    @ap_specific_goal = @ap_general_goal.ap_specific_goals.find_by(id: params[:id])
  end

  def ap_specific_goal_params
    params.require(:ap_specific_goal).permit(:goal, :weight, :completedPercentage)
  end

  def set_ap_general_goal
    @ap_general_goal = ApGeneralGoal.find(params[:ap_general_goal_id])
  end
end
