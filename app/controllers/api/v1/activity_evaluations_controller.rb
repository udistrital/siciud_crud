module Api
  module V1
    class ActivityEvaluationsController < ApplicationController
      include Swagger::ActivityEvaluationApi

      before_action :set_activity_schedule, only: [:create]
      before_action :set_activity_evaluation, only: [:show, :update]

      # GET /proposal/:proposal_id/activity_evaluations
      # GET /activity_evaluations
      def index
        if params[:proposal_id]
          @activity_evaluations = CompleteActivityEvaluation.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @activity_evaluations = CompleteActivityEvaluation.all
        end
        @activity_evaluations = DxService.load(@activity_evaluations, params)

        render json: @activity_evaluations
      end

      # GET /activity_evaluations/1
      def show
        render json: @activity_evaluation
      end

      # POST /activity_schedules/:activity_schedule_id/activity_evaluations
      def create
        @activity_evaluation = ActivityEvaluation.new(act_eval_params_to_create)
        @activity_evaluation.activity_schedule_id = @activity_schedule.id

        if @activity_evaluation.save
          render json: @activity_evaluation, status: :created
        else
          render json: @activity_evaluation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /activity_evaluations/1
      def update
        if @activity_evaluation.update(act_eval_params_to_update)
          render json: @activity_evaluation
        else
          render json: @activity_evaluation.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_activity_evaluation
        @activity_evaluation = ActivityEvaluation.find(params[:id])
      end

      def set_activity_schedule
        @activity_schedule = ActivitySchedule.find(params[:activity_schedule_id])
      end

      # Only allow a trusted parameter "white list" through.
      def act_eval_params_to_create
        params.require(:activity_evaluation).permit(:notified_due_to_expire,
                                                    :notified_expired, :state_id,
                                                    :is_completed,
                                                    :active, :created_by)
      end

      def act_eval_params_to_update
        params.require(:activity_evaluation).permit(:activity_schedule_id,
                                                    :notified_due_to_expire,
                                                    :notified_expired, :state_id,
                                                    :is_completed,
                                                    :active, :updated_by)
      end
    end
  end
end