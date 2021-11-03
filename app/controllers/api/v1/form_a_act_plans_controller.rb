module Api
  module V1
    class FormAActPlansController < AbstractActionPlanController
      include Swagger::FormAActPlanApi

      before_action :set_action_plan_to_form, only: [:index, :create, :update]
      before_action :set_form_a_act_plan, only: [:show, :update]

      # GET /action_plans/:id/form_a_act_plans
      def index
        @form_a_act_plans = CompleteFormAActP.where(
          "action_plan_id = ?", params[:action_plan_id]
        )
        @form_a_act_plans = DxService.load(@form_a_act_plans, params)

        render json: @form_a_act_plans
      end

      # GET /form_a_act_plans/1
      def show
        render json: @form_a_act_plan
      end

      # POST /action_plans/:id/form_a_act_plans
      def create
        @form_a_act_plan = @action_plan.form_a_act_plans.new(
          form_a_act_p_params_to_create)

        if @form_a_act_plan.save
          render json: @form_a_act_plan, status: :created
        else
          render json: @form_a_act_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /form_a_act_plans/1
      def update
        body_ap = form_a_act_p_params_to_update.except(:advanced_total)
        body_mr = form_a_act_p_params_to_update.except(:product_type_id,
                                                       :indicator_id,
                                                       :goal, :order,
                                                       :action_plan_id,
                                                       :plan_type_id,
                                                       :active)
        result = ActionPlanService.form_is_upgradeable(@action_plan,
                                                       @form_a_act_plan,
                                                       body_ap,
                                                       body_mr,
                                                       [
                                                         :product_type_id, :indicator_id,
                                                         :goal, :advanced_total,
                                                         :order, :action_plan_id,
                                                         :plan_type_id],
                                                       ", form a.")
        if result[:is_upgradeable]
          if @form_a_act_plan.update(result[:body_params])
            render json: @form_a_act_plan
          else
            render json: @form_a_act_plan.errors, status: :unprocessable_entity
          end
        else
          render json: { error: result[:msg] },
                 status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_form_a_act_plan
        @form_a_act_plan = FormAActPlan.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def form_a_act_p_params_to_create
        params.require(:form_a_act_plan).permit(:product_type_id, :indicator_id,
                                                :goal, :order,
                                                :plan_type_id, :active, :created_by)
      end

      def form_a_act_p_params_to_update
        params.require(:form_a_act_plan).permit(:product_type_id, :indicator_id,
                                                :goal, :advanced_total, :order, :action_plan_id,
                                                :plan_type_id, :active, :updated_by)
      end
    end
  end
end