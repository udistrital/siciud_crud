class Api::V1::ArpActivityController < ApplicationController
  include Swagger::ArpActivityApi

  before_action :set_arp_specific_goal
  before_action :set_arp_activity, only: [:show, :update]
  #before_action :set_arp_general_goal, only: [:report_progress]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    #Listar todas las actividades
    @arp_activities = @arp_specific_goal.arp_activities
    render json: @arp_activities
  end

  def show
    render json: @arp_activity
  end

  def create
    #byebug
    @arp_activity = @arp_specific_goal.arp_activities.new(arp_activity_params)
    @arp_activity.completedPercentage = 0
    if @arp_specific_goal.save
      render json: @arp_activity, status: :created
    else
      render json: @arp_activity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @arp_activity.update(arp_activity_params)
      render json: @arp_activity
    else
      render json: @arp_activity.errors, status: :unprocessable_entity
    end
  end

  # def report_progress
  #   #byebug
  #   if (@arp_general_goal.arp_specific_goals.sum(:weight) == 100)
  #     if @arp_activity.update(params.require(:arp_activity).permit(:completedPercentage))
  #       set_arp_specific_goal_progress
  #       @arp_specific_goal.save
  #       set_arp_general_goal_progress
  #       @arp_general_goal.save
  #       render json: @arp_activity
  #     else
  #       render json: @arp_activity.errors, status: :unprocessable_entity
  #     end
  #   else
  #     render json: { "error": "EL peso de todas los objetivos especificos deben sumar 100% antes de agregar progreso la actividad" }, status: :not_acceptable
  #   end
  # end

  private

  def set_arp_specific_goal_progress
    @arp_specific_goal.completedPercentage = (@arp_specific_goal.arp_activities.map { |n| n.completedPercentage }.inject { |sum, x| sum + x } / @arp_specific_goal.arp_activities.size)
  end

  def set_arp_general_goal_progress
    @arp_general_goal.completedPercentage = (@arp_general_goal.arp_specific_goals.map { |n| n.weight * n.completedPercentage }.inject { |sum, x| sum + x } / 100)
  end

  def set_arp_general_goal
    @arp_general_goal = @arp_specific_goal.arp_general_goal
  end

  def set_arp_activity
    @arp_activity = @arp_specific_goal.arp_activities.find_by(id: params[:id])
  end

  def arp_activity_params
    params.require(:arp_activity).permit(:activity)
  end

  def set_arp_specific_goal
    @arp_specific_goal = ArpSpecificGoal.find(params[:arp_specific_goal_id])
  end
end
