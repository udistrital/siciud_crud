module Api
  module V1
    class ActionPlansController < ApplicationController
      include Swagger::ActionPlanApi

      before_action :set_research_group, only: [:create]
      before_action :set_action_plan, only: [:show, :update]

      # GET /research_units/:id/action_plans
      # GET /action_plans
      def index
        if params[:research_group_id]
          @action_plans = CompleteActionPlan.where(
            "research_group_id = ?",
            params[:research_group_id]
          )
        else
          @action_plans = CompleteActionPlan.all
        end
        @action_plans = DxService.load(@action_plans, params)

        render json: @action_plans
      end

      # GET /action_plans/1
      def show
        render json: @action_plan
      end

      # POST /research_units/:id/action_plans
      def create
        @action_plan = @research_group.action_plans.new(
          act_plan_params_to_create)

        if @action_plan.save
          render json: @action_plan, status: :created
        else
          render json: @action_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /action_plans/1
      def update
        if @action_plan.is_draft or act_plan_params_to_update[:is_draft]
          if @action_plan.update(act_plan_params_to_update)
            render json: @action_plan
          else
            render json: @action_plan.errors, status: :unprocessable_entity
          end
        elsif (@action_plan.is_draft != act_plan_params_to_update[:is_draft] and
          act_plan_params_to_update.key? :is_draft) or
          @action_plan.active != act_plan_params_to_update[:active]

          if @action_plan.update(act_plan_params_to_update.except(:execution_validity,
                                                                  :research_group_id))
            render json: @action_plan
          else
            render json: @action_plan.errors, status: :unprocessable_entity
          end
        else
          msg = "The action plan cannot be edited because it is not a draft"
          render json: { error: msg },
                 status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_action_plan
        @action_plan = ActionPlan.find(params[:id])
      end

      def set_research_group
        @research_group = ResearchGroup.find(params[:research_group_id])
      end

      # Only allow a trusted parameter "white list" through.
      def act_plan_params_to_create
        params.require(:action_plan).permit(:execution_validity,
                                            :is_draft, :research_group_id,
                                            :active, :created_by)
      end

      def act_plan_params_to_update
        params.require(:action_plan).permit(:execution_validity,
                                            :is_draft, :research_group_id,
                                            :active, :updated_by)
      end
    end
  end
end