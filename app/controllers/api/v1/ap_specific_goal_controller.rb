class Api::V1::ApSpecificGoalController < ApplicationController
  include Swagger::ApSpecificGoalApi

  before_action :set_ap_general_goal
  before_action :set_ap_specific_goal, only: [:show, :update]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

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
    if (@ap_general_goal.ap_specific_goals.sum(:weight) + (params[:ap_specific_goal][:weight])) <= 100
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
      if @ap_specific_goal.completedPercentage == 0
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
        render json: { "error": "No se puede cambiar el peso de una actividad que ya avanzo" }, status: :not_acceptable
      end
      # elsif (params[:ap_specific_goal][:completedPercentage])
      #   if (@ap_general_goal.ap_specific_goals.sum(:weight) == 100)
      #     if (((params[:ap_specific_goal][:completedPercentage]) <= 100))
      #       if @ap_specific_goal.update(ap_specific_goal_percetange_params)
      #         render json: @ap_specific_goal
      #       else
      #         render json: @ap_specific_goal.errors, status: :unprocessable_entity
      #       end
      #     else
      #       render json: { "error": "El cumplimiento maximo de la actividad es 100%" }, status: :not_acceptable
      #     end
      #   else
      #     render json: { "error": "Todos los objetivos especificos deben sumar 100% antes de agregar progreso a un objetivo especifico" }, status: :not_acceptable
      #   end
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
    params.require(:ap_specific_goal).permit(:goal, :weight)
  end

  # def ap_specific_goal_percetange_params
  #   params.require(:ap_specific_goal).permit(:completedPercentage)
  # end

  def set_ap_general_goal
    @ap_general_goal = ApGeneralGoal.find(params[:ap_general_goal_id])
  end
end
