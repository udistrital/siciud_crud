module Api
  module V1
    class ActionPlansController < ApplicationController

      before_action :set_research_group, only: [:show, :create, :update, :publish]
      before_action :set_action_plan, only: [:show, :update, :publish]

      # GET /research_units/:id/action_plans
      def index
        @action_plans = ActionPlan.where(
          "research_group_id = ?",
          params[:research_group_id]
        )

        render json: @action_plans
      end

      # GET /research_units/:id/action_plans/1
      def show
        render json: @action_plan
      end

      # POST /research_units/:id/action_plans
      def create
        @action_plan = @research_group.action_plans.new(
          action_plan_params_to_create)

        if @action_plan.save
          render json: @action_plan, status: :created
        else
          render json: @action_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/action_plans/1
      def update
        if @action_plan.is_draft
          if @action_plan.update(action_plan_params_to_update)
            render json: @action_plan
          else
            render json: @action_plan.errors, status: :unprocessable_entity
          end
        else
          msg = "The action plan cannot be edited because it has already been published"
          render json: { error: msg },
                 status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/action_plans/1/publish
      def publish
        @action_plan.is_draft = false
        if @action_plan.update(action_plan_params_to_update)
          render json: @action_plan
        else
          render json: @action_plan.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_action_plan
        @action_plan = @research_group.action_plans.find(params[:id])
      end

      def set_research_group
        @research_group = ResearchGroup.find(params[:research_group_id])
      end

      # Only allow a trusted parameter "white list" through.
      def action_plan_params_to_create
        params.require(:action_plan).permit(:execution_validity,
                                            :research_group_id,
                                            :active, :created_by)
      end

      def action_plan_params_to_update
        params.require(:action_plan).permit(:execution_validity,
                                            :research_group_id,
                                            :active, :updated_by)
      end
    end
  end
end