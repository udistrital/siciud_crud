class Api::V1::ApActivityController < ApplicationController
  include Swagger::ApActivityApi

  before_action :set_ap_specific_goal
  before_action :set_ap_activity, only: [:show, :update]

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
    @ap_activity = @ap_specific_goal.ap_activities.new(ap_activity_params)
    if @ap_specific_goal.save
      render json: @ap_activity, status: :created
    else
      render json: @ap_activity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ap_activity.update(ap_activity_params)
      render json: @ap_activity
    else
      render json: @ap_activity.errors, status: :unprocessable_entity
    end
  end
  
  def reportProgress

  end

  private

  def set_ap_activity
    @ap_activity = @ap_specific_goal.ap_activities.find_by(id: params[:id])
  end

  def ap_activity_params
    params.require(:ap_activity).permit(:activity)
  end

  def set_ap_specific_goal
    @ap_specific_goal = ApSpecificGoal.find(params[:ap_specific_goal_id])
  end
end
