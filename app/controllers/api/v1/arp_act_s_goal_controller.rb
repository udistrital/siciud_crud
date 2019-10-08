class Api::V1::ArpActSGoalController < ApplicationController
#  before_action :set_arp_activity
  before_action :set_arp_act_s_goal, only: [:show, :update]
  before_action :set_arp_specific_goal #, only: [:report_progress]

  def index
    @arp_act_s_goals = @arp_specific_goal.arp_act_s_goals
    render json: @arp_activity_reports
  end

  def create
    # if @arp_general_goal.arp_specific_goals.sum(:weight) == 100 && @arp_act_s_goal.arp_activities.sum(:weight) == 100
    #   if @arp_activity.arp_activity_reports.last.nil? || @arp_activity.arp_activity_reports.last.status != "inReview"
    #     if @arp_activity.completedPercentage < params[:completedPercentage].to_f && params[:completedPercentage].to_f <= 100
    @arp_act_s_goal = @arp_specific_goal.arp_act_s_goals.new(arp_act_s_goal_params)
    #byebug
    if @arp_act_s_goal.save
      render json: @arp_act_s_goal, status: :created
    else
      render json: @arp_act_s_goal.errors, status: :unprocessable_entity
    end
    #     else
    #       render json: {"error": "No se puede hacer un reporte de progreso menor al que ya fue aprobado o mayor a 100"}, status: :unprocessable_entity
    #     end
    #   else
    #     render json: {"error": "Actualmente ya se encuentra un reporte en revision"}, status: :unprocessable_entity
    #   end
    # else
    #   render json: {"error": "EL peso de todas los objetivos especificos deben sumar 100% antes de agregar progreso la actividad"}, status: :not_acceptable
    # end
  end

  def show
    render json: @arp_activity_report
  end

  def update
    if @arp_activity_report.update(arp_activity_report_params)
      render json: @arp_activity_report
    else
      render json: @arp_activity_report.errors, status: :unprocessable_entity
    end
  end


  private


  def set_arp_act_s_goal
    @arp_act_s_goal = @arp_specific_goal.arp_act_s_goals.find_by(id: params[:id])
  end

  #def set_arp_activity
  # @arp_activity = ArpActivity.find(params[:arp_activity_id])
  #end

  def arp_act_s_goal_params
    params.require(:arp_act_s_goal).permit(:arp_activity_id, :weight)
  end


  def set_arp_specific_goal
    @arp_specific_goal = ArpSpecificGoal.find(params[:arp_specific_goal_id])
  end
end
