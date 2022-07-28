module Api
  module V1
    class ActivitySchedulesController < AbstractProposalController
      include Swagger::ActivityScheduleApi

      before_action :set_proposal, only: [:create]
      before_action :set_activity_schedule, only: [:show, :update]

      # GET /proposal/:proposal_id/activity_schedules
      def index
        if params[:proposal_id]
          @activity_schedules = ActivitySchedule.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @activity_schedules = ActivitySchedule.all
        end
        @activity_schedules = DxService.load(@activity_schedules, params)

        render json: @activity_schedules
      end

      # GET /activity_schedules/1
      def show
        render json: @activity_schedule
      end

      # POST /proposal/:proposal_id/activity_schedules
      def create
        @activity_schedule = @proposal.activity_schedules.new(
          act_schedule_params_to_create.except(:objective_ids))

        if @activity_schedule.save
          @activity_schedule = save_objectives(@activity_schedule)
          render json: @activity_schedule, status: :created
        else
          render json: @activity_schedule.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /activity_schedules/1
      def update
        if @activity_schedule.update(act_schedule_params_to_update)
          render json: @activity_schedule
        else
          render json: @activity_schedule.errors, status: :unprocessable_entity
        end
      end

      private

      def save_objectives(activity_schedule)
        if params[:activity_schedule].has_key?(:objective_ids)
          activity_schedule.objective_ids = (params[:activity_schedule][:objective_ids]).map(&:to_i).uniq
        end
        activity_schedule
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_activity_schedule
        @activity_schedule = ActivitySchedule.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def act_schedule_params_to_create
        params.require(:activity_schedule).permit(:name, :description,
                                                  :start_date, :end_date, :duration,
                                                  :deliverable, :proposal_id, :active,
                                                  :created_by, objective_ids: [])
      end

      def act_schedule_params_to_update
        params.require(:activity_schedule).permit(:name, :description,
                                                  :start_date, :end_date, :duration,
                                                  :deliverable, :proposal_id, :active,
                                                  :updated_by, objective_ids: [])
      end
    end
  end
end