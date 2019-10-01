class Api::V1::ArpActivityReportController < ApplicationController
  before_action :set_arp_activity
  before_action :set_arp_activity_report, only: [:show, :update]

  #before_action :set_arp_specific_goal, only: [:report_progress]
  #before_action :set_arp_general_goal, only: [:report_progress]

  def index
    @arp_activity_reports = @arp_activity.arp_activity_reports
    render json: @arp_activity_reports
  end

  def create
    if @arp_activity.arp_activity_reports.last.nil? || @arp_activity.arp_activity_reports.last.status != "inReview"
      @arp_activity_report = @arp_activity.arp_activity_reports.new(arp_activity_report_params)
      if @arp_activity_report.save
        render json: @arp_activity_report, status: :created
      else
        render json: @arp_activity_report.errors, status: :unprocessable_entity
      end
    else
      render json: {"error": "Actualmente ya se encuentra un reporte en revision"}, status: :unprocessable_entity
    end
  end

  def show
    render json: @arp_activity_report
  end

  def update
    if @arp_activity_report.status == "inReview"
      if @arp_activity_report.update(arp_activity_report_params)
        render json: @arp_activity_report
      else
        render json: @arp_activity_report.errors, status: :unprocessable_entity
      end
    else
      render json: {"error": "Este reporte ya fue revisado por lo que no es posible actualizarlo"}, status: :unprocessable_entity

    end
  end

  # def report_progress
  #   #byebug
  #   if @arp_general_goal.arp_specific_goals.sum(:weight) == 100
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
  #     render json: {"error": "EL peso de todas los objetivos especificos deben sumar 100% antes de agregar progreso la actividad"}, status: :not_acceptable
  #   end
  # end

  private

  # def set_arp_specific_goal_progress
  #   @arp_specific_goal.completedPercentage = (@arp_specific_goal.arp_activities.map { |n| n.completedPercentage }.inject { |sum, x| sum + x } / @arp_specific_goal.arp_activities.size)
  # end
  #
  # def set_arp_general_goal_progress
  #   @arp_general_goal.completedPercentage = (@arp_general_goal.arp_specific_goals.map { |n| n.weight * n.completedPercentage }.inject { |sum, x| sum + x } / 100)
  # end
  #
  # def set_arp_general_goal
  #   @arp_general_goal = @arp_specific_goal.arp_general_goal
  # end

  def set_arp_activity_report
    @arp_activity_report = @arp_activity.arp_activity_reports.find_by(id: params[:id])
  end

  def set_arp_activity
    @arp_activity = ArpActivity.find(params[:arp_activity_id])
  end

  def arp_activity_report_params
    params.permit(:completedPercentage, :supportDocument)
  end

=begin
  def set_arp_specific_goal
    @arp_specific_goal = ArpSpecificGoal.find(params[:arp_specific_goal_id])
  end
=end
end
