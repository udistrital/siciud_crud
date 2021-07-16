module Api
  module V1
    class ScheduleActivitiesController < AbstractCallController
      include Swagger::ScheduleActivityApi

      before_action :set_call, only: [:create]
      before_action :set_schedule_activity, only: [:show, :update]

      # GET calls/:call_id/schedule_activities
      def index
        @schedule_activities = ScheduleActivity.where(
          "call_id = ?", params[:call_id]
        )
        @schedule_activities = DxService.load(@schedule_activities, params)

        render json: @schedule_activities
      end

      # GET /schedule_activities/1
      def show
        render json: @schedule_activity
      end

      # POST calls/:call_id/schedule_activities
      def create
        @schedule_activity = @call.schedule_activities.new(schedule_act_params_to_create)

        if @schedule_activity.save
          render json: @schedule_activity, status: :created
        else
          render json: @schedule_activity.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /schedule_activities/1
      def update
        if @schedule_activity.update(schedule_act_params_to_update)
          render json: @schedule_activity
        else
          render json: @schedule_activity.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_schedule_activity
        @schedule_activity = ScheduleActivity.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def schedule_act_params_to_create
        params.require(:schedule_activity).permit(:sa_order, :sa_description,
                                                  :sa_date, :sa_responsible,
                                                  :active, :created_by)
      end

      def schedule_act_params_to_update
        params.require(:schedule_activity).permit(:call_id, :sa_order, :sa_description,
                                                  :sa_date, :sa_responsible,
                                                  :active, :updated_by)
      end
    end
  end
end