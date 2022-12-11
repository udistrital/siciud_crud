module Api
  module V1
    class ProjectActivityInformationController < ApplicationController

      # GET /projects/summary
      def summary
        @projects = ActivityEvaluationNotification.where(
          "total_notified_due_to_expire > 0 OR total_notified_expired > 0"
        )

        @projects = DxService.load(@projects, params)

        render json: @projects
      end

      # GET /projects/:proposal_id/expired_activities
      def expired_activities
        @activities = CompleteProjectActivity.where(
          "is_completed = FALSE AND notified_expired = FALSE AND end_date < CURRENT_DATE AND proposal_id = ?",
          params[:proposal_id]
        )

        @activities = DxService.load(@activities, params)

        render json: @activities
      end

      # GET /projects/:proposal_id/activities_to_expire?delta_days=0
      def activities_to_expire
        @activities = CompleteProjectActivity.where(
          "is_completed = FALSE AND notified_due_to_expire = FALSE AND end_date < (CURRENT_DATE + ?) AND proposal_id = ?",
          params[:delta_days], params[:proposal_id]
        )

        @activities = DxService.load(@activities, params)

        render json: @activities
      end
    end
  end
end