module Api
  module V1
    class ProjectActivityInformationController < ApplicationController
      include Swagger::ProjectActivityInformationSchema
      include Swagger::ProjectActivityInformationApi

      # GET /projects/summary
      def summary
        if params[:role_id]
          @projects = ActivityEvaluationNotification.where(
            "(total_notified_due_to_expire > 0 OR total_notified_expired > 0) AND role_id = ?",
            params[:role_id]
          )
        else
          @projects = ActivityEvaluationNotification.where(
            "total_notified_due_to_expire > 0 OR total_notified_expired > 0"
          )
        end

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
          params[:delta_days].to_i, params[:proposal_id]
        )

        @activities = DxService.load(@activities, params)

        render json: @activities
      end

      # PUT /notified_activities
      def update_notified
        updated_activities = []
        if params[:notified_activity].has_key?(:notified_due_to_expire_ids)
          activity_ids = (params[:notified_activity][:notified_due_to_expire_ids]).map(&:to_i).uniq
          activity_ids.each do |act_schedule_id|
            @activity_evaluation = ActivityEvaluation.find_by(activity_schedule_id: act_schedule_id)
            unless @activity_evaluation.nil?
              @activity_evaluation.update(notified_due_to_expire: true)
              updated_activities.append(act_schedule_id)
            end
          end
        end

        if params[:notified_activity].has_key?(:notified_expired_ids)
          activity_ids = (params[:notified_activity][:notified_expired_ids]).map(&:to_i).uniq
          activity_ids.each do |act_schedule_id|
            @activity_evaluation = ActivityEvaluation.find_by(activity_schedule_id: act_schedule_id)
            unless @activity_evaluation.nil?
              @activity_evaluation.update(notified_expired: true)
              updated_activities.append(act_schedule_id)
            end
          end
        end

        render json: {"updated_activities": updated_activities.uniq}, status: :ok
      end

      private

      def notified_activities_params
        params.require(:notified_activity).permit(notified_due_to_expire_ids: [],
                                                  notified_expired_ids: []
        )
      end
    end
  end
end