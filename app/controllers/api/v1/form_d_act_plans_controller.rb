module Api
  module V1
    class FormDActPlansController < ApplicationController
      before_action :set_form_d_act_plan, only: [:show, :update]

      # GET /form_d_act_plans
      def index
        @form_d_act_plans = FormDActPlan.all

        render json: @form_d_act_plans
      end

      # GET /form_d_act_plans/1
      def show
        render json: @form_d_act_plan
      end

      # POST /form_d_act_plans
      def create
        @form_d_act_plan = FormDActPlan.new(form_d_act_pl_params_to_create)

        if @form_d_act_plan.save
          render json: @form_d_act_plan, status: :created
        else
          render json: @form_d_act_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /form_d_act_plans/1
      def update
        if @form_d_act_plan.update(form_d_act_pl_params_to_update)
          render json: @form_d_act_plan
        else
          render json: @form_d_act_plan.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_form_d_act_plan
        @form_d_act_plan = FormDActPlan.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def form_d_act_pl_params_to_create
        params.require(:form_d_act_plan).permit(:name, :description,
                                                :goal_state_id, :goal_achieved,
                                                :order, :action_plan_id,
                                                :plan_type_id, :active,
                                                :created_by,
                                                cine_detailed_area_ids: [],
                                                cine_specific_area_ids: [],
                                                oecd_discipline_ids: [],
                                                oecd_knowledge_subarea_ids: [])
      end

      def form_d_act_pl_params_to_update
        params.require(:form_d_act_plan).permit(:name, :description,
                                                :goal_state_id, :goal_achieved,
                                                :order, :action_plan_id,
                                                :plan_type_id, :active,
                                                :updated_by,
                                                cine_detailed_area_ids: [],
                                                cine_specific_area_ids: [],
                                                oecd_discipline_ids: [],
                                                oecd_knowledge_subarea_ids: [])
      end
    end
  end
end