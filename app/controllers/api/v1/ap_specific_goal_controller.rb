class Api::V1::ApSpecificGoalController < ApplicationController
  include Swagger::ApSpecificGoalApi

  before_action :set_ap_general_goal
  before_action :set_ap_specific_goal, only: [:show, :update]

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
    @ap_specific_goal = @ap_general_goal.ap_specific_goals.new(ap_specific_goal_params)
    if @ap_specific_goal.save
      render json: @ap_specific_goal, status: :created
    else
      render json: @ap_specific_goal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ap_general_goal.update(ap_specific_goal_params)
      render json: @ap_specific_goal
    else
      render json: @ap_specific_goal.errors, status: :unprocessable_entity
    end
  end

  private

  def set_ap_specific_goal
    @ap_specific_goal = @ap_general_goal.ap_specific_goals.find_by(id: params[:id])
  end

  def ap_specific_goal_params
    params.require(:ap_specific_goal).permit(:goal)
  end

  def set_ap_general_goal
    @ap_general_goal = ApGeneralGoal.find(params[:ap_general_goal_id])
  end
end
