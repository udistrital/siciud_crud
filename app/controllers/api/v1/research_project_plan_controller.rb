module Api
  module V1
    class ResearchProjectPlanController < ApplicationController
      before_action :set_plan_period
      before_action :set_research_project_plan, only: [:show, :update, :destroy]

      # GET /research_project_plans
      def index
        @research_project_plans = @plan_period.research_project_plans

        render json: @research_project_plans
      end

      # GET /research_project_plans/1
      def show
        render json: @research_project_plan
      end

      # POST /research_project_plans
      def create
        @research_project_plan = @plan_period.research_project_plans.new(research_project_plan_params)

        if @research_project_plan.save
          render json: @research_project_plan, status: :created
          #, location: research_project_plan_path(@research_project_plan)
        else
          render json: @research_project_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_project_plans/1
      def update
        if @research_project_plan.update(research_project_plan_params)
          render json: @research_project_plan
        else
          render json: @research_project_plan.errors, status: :unprocessable_entity
        end
      end

      # DELETE /research_project_plans/1
      def destroy
        @research_project_plan.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_research_project_plan
        @research_project_plan = @plan_period.research_project_plans.find_by(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def research_project_plan_params
        params.require(:research_project_plan).permit(:activity, :description, :goal, :plan_period_id)
      end

      def set_plan_period
        @plan_period = PlanPeriod.find(params[:plan_period_id])
      end
    end
  end
end
