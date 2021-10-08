module Api
  module V1
    class FormBActPlansController < AbstractActionPlanController
      include Swagger::FormBActPlanApi

      before_action :set_action_plan_to_form, only: [:index, :create, :update]
      before_action :set_form_b_act_plan, only: [:show, :update]

      # GET /action_plans/:id/form_b_act_plans
      def index
        @form_b_act_plans = CompleteFormBActP.where(
          "action_plan_id = ?", params[:action_plan_id]
        )
        @form_b_act_plans = DxService.load(@form_b_act_plans, params)

        render json: @form_b_act_plans
      end

      # GET /form_b_act_plans/1
      def show
        render json: @form_b_act_plan
      end

      # POST /action_plans/:id/form_b_act_plans
      def create
        @form_b_act_plan = @action_plan.form_b_act_plans.new(
          form_b_act_p_params_to_create)

        if @form_b_act_plan.save
          render json: @form_b_act_plan, status: :created
        else
          render json: @form_b_act_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /form_b_act_plans/1
      def update
        body_ap = form_b_act_p_params_to_update.except(:goal_achieved)
        body_mr = form_b_act_p_params_to_update.except(:financing_type_id, :description,
                                                       :goal_state_id, :order,
                                                       :action_plan_id, :plan_type_id,
                                                       :active)
        result = ActionPlanService.form_is_upgradeable(@action_plan,
                                                       @form_b_act_plan,
                                                       body_ap,
                                                       body_mr,
                                                       [
                                                         :financing_type_id, :description,
                                                         :goal_state_id, :goal_achieved,
                                                         :order, :action_plan_id,
                                                         :plan_type_id],
                                                       ", form b.")
        if result[:is_upgradeable]
          if @form_b_act_plan.update(result[:body_params])
            render json: @form_b_act_plan
          else
            render json: @form_b_act_plan.errors, status: :unprocessable_entity
          end
        else
          render json: { error: result[:msg] },
                 status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_form_b_act_plan
        @form_b_act_plan = FormBActPlan.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def form_b_act_p_params_to_create
        params.require(:form_b_act_plan).permit(:financing_type_id, :description,
                                                :goal_state_id, :goal_achieved, :order,
                                                :plan_type_id,
                                                :active, :created_by)
      end

      def form_b_act_p_params_to_update
        params.require(:form_b_act_plan).permit(:financing_type_id, :description,
                                                :goal_state_id, :goal_achieved, :order,
                                                :action_plan_id, :plan_type_id,
                                                :active, :updated_by)
      end
    end
  end
end