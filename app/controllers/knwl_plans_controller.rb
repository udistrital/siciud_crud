module Api
  module V1
    class KnwlPlansController < ApplicationController

      before_action :set_knwl_area_context, only: [:index, :show, :create, :update]
      before_action :set_knwl_area_view, only: [:index, :show, :create, :update]
      before_action :set_knwl_plan, only: [:show, :update]

      # GET context/:id/knwl_plans
      def index
        if params[:form_d_act_plan_id]
          @knwl_plans = @complete_knwl_area_view.where(
            form_d_act_plan_id: params[:form_d_act_plan_id]
          )
        else
          context_name = @knwl_context.class.name
          @knwl_plans = @complete_knwl_area_view.where(
            knwl_area_type: context_name, knwl_area_id: @knwl_context.id
          )
        end
        @knwl_plans = DxService.load(@knwl_plans, params)

        render json: @knwl_plans
      end

      # GET context/:id/knwl_plans/1
      def show
        render json: @knwl_plan
      end

      # POST context/:id/knwl_plans
      def create
        @knwl_plan = @knwl_context.knwl_plans.new(knwl_plan_params_to_create)

        if @knwl_plan.save
          render json: @knwl_plan, status: :created
        else
          render json: @knwl_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT context/:id/knwl_plans/1
      def update
        if @knwl_plan.update(knwl_plan_params_to_update)
          render json: @knwl_plan
        else
          render json: @knwl_plan.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_knwl_plan
        @knwl_plan = @knwl_context.knwl_plans.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def knwl_plan_params_to_create
        params.require(:knwl_plan).permit(:form_d_act_plan_id,
                                          :active, :created_by)
      end

      def knwl_plan_params_to_update
        params.require(:knwl_plan).permit(:form_d_act_plan_id,
                                          :active, :updated_by)
      end

      def set_knwl_area_context
        if params[:oecd_discipline_id]
          id = params[:oecd_discipline_id]
          @knwl_context = OecdDiscipline.find(id)
        elsif params[:cine_detailed_area_id]
          id = params[:cine_detailed_area_id]
          @knwl_context = CineDetailedArea.find(id)
        end
      end

      def set_knwl_area_view
        if params[:oecd_discipline_id]
          @complete_knwl_area_view = CompleteKnwlAreaPlanOecd
        elsif params[:cine_detailed_area_id]
          @complete_knwl_area_view = CompleteKnwlAreaPlanCine
        end
      end
    end
  end
end