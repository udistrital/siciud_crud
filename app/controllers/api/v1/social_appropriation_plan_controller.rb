module Api
  module V1
    class SocialAppropriationPlanController < ApplicationController
      before_action :set_social_appropriation_plan, only: [:show, :update, :destroy]

      # GET /social_appropriation_plans
      def index
        @social_appropriation_plans = SocialAppropriationPlan.all.order(:created_at)

        render json: @social_appropriation_plans
      end

      # GET /social_appropriation_plans/1
      def show
        render json: @social_appropriation_plan
      end

      # POST /social_appropriation_plans
      def create
        @social_appropriation_plan = SocialAppropriationPlan.new(social_appropriation_plan_params)
        @social_appropriation_plan.plan_period_id = params[:plan_period_id]
        if @social_appropriation_plan.save
          render json: @social_appropriation_plan, status: :created
          #, location: @social_appropriation_plan
        else
          render json: @social_appropriation_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /social_appropriation_plans/1
      def update
        if @social_appropriation_plan.update(social_appropriation_plan_params)
          render json: @social_appropriation_plan
        else
          render json: @social_appropriation_plan.errors, status: :unprocessable_entity
        end
      end

      # DELETE /social_appropriation_plans/1
      def destroy
        @social_appropriation_plan.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_social_appropriation_plan
        @social_appropriation_plan = SocialAppropriationPlan.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def social_appropriation_plan_params
        params.require(:social_appropriation_plan).permit(:activity, :description, :goal, :plan_period_id)
      end
    end
  end
end
