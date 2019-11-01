class Api::V1::ArpActivityController < ApplicationController
  include Swagger::ArpActivityApi

  #before_action :set_arp_specific_goal
  before_action :set_agreement_research_project
  #before_action :set_arp_specific_goal
  before_action :set_arp_activity, only: [:show, :update]
  #before_action :set_arp_general_goal, only: [:report_progress]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def index
    #Listar todas las actividades
    @arp_activities = @agreement_research_project.arp_activities
    render json: @arp_activities
  end

  def show
    render json: @arp_activity
  end

  def create

    #byebug
    #if (@arp_specific_goal.arp_activities.sum(:weight) + (params[:arp_activity][:weight])) <= 100
    @arp_activity = @agreement_research_project.arp_activities.new(arp_activity_params)
    @arp_activity.completedPercentage = 0
    if @arp_activity.save
      render json: @arp_activity, status: :created
    else
      render json: @arp_activity.errors, status: :unprocessable_entity
    end
    # else
    #   render json: {"error": "Los pesos no pueden sumar mas de 100 puntos"}, status: :not_acceptable
    # end
  end

  def update
    if @arp_activity.update(arp_activity_params)
      render json: @arp_activity
    else
      render json: @arp_activity.errors, status: :unprocessable_entity
    end
  end

  private

  def set_arp_activity
    @arp_activity = @arp_specific_goal.arp_activities.find_by(id: params[:id])
  end

  def arp_activity_params
    params.require(:arp_activity).permit(:activity, :startDate, :finishDate)
  end

  def set_agreement_research_project
    @agreement_research_project = AgreementResearchProject.find(params[:agreement_research_project_id])
  end

  def set_arp_specific_goal
    @arp_specific_goal = ArpSpecificGoal.find(params[:arp_specific_goal_id])
  end
end
