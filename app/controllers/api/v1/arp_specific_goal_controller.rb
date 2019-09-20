class Api::V1::ArpSpecificGoalController < ApplicationController
  include Swagger::ArpSpecificGoalApi

  before_action :set_arp_general_goal
  before_action :set_arp_specific_goal, only: [:show, :update, :reportProgress]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    #Listar todos los convenios
    @arp_specific_goal = @arp_general_goal.arp_specific_goals
    render json: @arp_specific_goal
  end

  def show
    render json: @arp_specific_goal
  end

  def create
    #byebug
    if ((@arp_general_goal.arp_specific_goals.sum(:weight) + (params[:arp_specific_goal][:weight])) <= 100)
      @arp_specific_goal = @arp_general_goal.arp_specific_goals.new(arp_specific_goal_params)
      @arp_specific_goal.completedPercentage = 0
      if @arp_specific_goal.save
        render json: @arp_specific_goal, status: :created
      else
        render json: @arp_specific_goal.errors, status: :unprocessable_entity
      end
    else
      render json: { "error": "Los pesos no pueden sumar mas de 100 puntos" }, status: :not_acceptable
    end
  end

  def update
    if (params[:arp_specific_goal][:weight])
      if @arp_specific_goal.completedPercentage == 0
        #if(params[:arp_specific_goal][:weight] ) Se debe validar que sea enviado
        diferenceCashValue = params[:arp_specific_goal][:weight] - @arp_specific_goal.weight
        if (((@arp_general_goal.arp_specific_goals.sum(:weight) + diferenceCashValue) <= 100))
          if @arp_specific_goal.update(arp_specific_goal_params)
            render json: @arp_specific_goal
          else
            render json: @arp_specific_goal.errors, status: :unprocessable_entity
          end
        else
          render json: { "error": "Los pesos no pueden sumar mas de 100 puntos" }, status: :not_acceptable
        end
      else
        render json: { "error": "No se puede cambiar el peso de una actividad que ya avanzo" }, status: :not_acceptable
      end
      # elsif (params[:arp_specific_goal][:completedPercentage])
      #   if (@arp_general_goal.arp_specific_goals.sum(:weight) == 100)
      #     if (((params[:arp_specific_goal][:completedPercentage]) <= 100))
      #       if @arp_specific_goal.update(arp_specific_goal_percetange_params)
      #         render json: @arp_specific_goal
      #       else
      #         render json: @arp_specific_goal.errors, status: :unprocessable_entity
      #       end
      #     else
      #       render json: { "error": "El cumplimiento maximo de la actividad es 100%" }, status: :not_acceptable
      #     end
      #   else
      #     render json: { "error": "Todos los objetivos especificos deben sumar 100% antes de agregar progreso a un objetivo especifico" }, status: :not_acceptable
      #   end
    else
      if @arp_specific_goal.update(arp_specific_goal_params)
        render json: @arp_specific_goal
      else
        render json: @arp_specific_goal.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def set_arp_specific_goal
    @arp_specific_goal = @arp_general_goal.arp_specific_goals.find_by(id: params[:id])
  end

  def arp_specific_goal_params
    params.require(:arp_specific_goal).permit(:goal, :weight)
  end

  # def arp_specific_goal_percetange_params
  #   params.require(:arp_specific_goal).permit(:completedPercentage)
  # end

  def set_arp_general_goal
    @arp_general_goal = ArpGeneralGoal.find(params[:arp_general_goal_id])
  end
end
