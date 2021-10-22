module Api
  module V1
    class FormDActPlansController < AbstractActionPlanController
      include Swagger::FormDActPlanApi

      before_action :set_action_plan_to_form, only: [:index, :create, :update]
      before_action :set_form_d_act_plan, only: [:show, :update]

      # GET /form_d_act_plans
      def index
        @form_d_act_plans = CompleteFormDActP.where(
          "action_plan_id = ?", params[:action_plan_id]
        )
        @form_d_act_plans = DxService.load(@form_d_act_plans, params)

        render json: @form_d_act_plans
      end

      # GET /form_d_act_plans/1
      def show
        render json: @form_d_act_plan
      end

      # POST /form_d_act_plans
      def create
        @form_d_act_plan = @action_plan.form_d_act_plans.new(
          form_d_act_pl_params_to_create)

        if @form_d_act_plan.save
          render json: @form_d_act_plan, status: :created
        else
          render json: @form_d_act_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /form_d_act_plans/1
      def update
        body_ap = form_d_act_pl_params_to_update.except(:goal_achieved)
        body_mr = form_d_act_pl_params_to_update.except(:name, :description,
                                                        :goal_state_id,
                                                        :order, :action_plan_id,
                                                        :plan_type_id, :active,
                                                        cine_detailed_area_ids: [],
                                                        cine_specific_area_ids: [],
                                                        oecd_discipline_ids: [],
                                                        oecd_knowledge_subarea_ids: [],
                                                        research_focus_ids: [],
                                                        snies_ids: [])
        result = ActionPlanService.form_is_upgradeable(@action_plan,
                                                       @form_d_act_plan,
                                                       body_ap,
                                                       body_mr,
                                                       [
                                                         :name, :description,
                                                         :goal_state_id,
                                                         :goal_achieved,
                                                         :order, :action_plan_id,
                                                         :plan_type_id,
                                                         cine_detailed_area_ids: [],
                                                         cine_specific_area_ids: [],
                                                         oecd_discipline_ids: [],
                                                         oecd_knowledge_subarea_ids: [],
                                                         research_focus_ids: [],
                                                         snies_ids: []],
                                                       ", form d.")
        if result[:is_upgradeable]
          if @form_d_act_plan.update(result[:body_params])
            render json: @form_d_act_plan
          else
            render json: @form_d_act_plan.errors, status: :unprocessable_entity
          end
        else
          render json: { error: result[:msg] },
                 status: :unprocessable_entity
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
                                                :goal_state_id,
                                                :order,
                                                :plan_type_id, :active,
                                                :created_by,
                                                cine_detailed_area_ids: [],
                                                cine_specific_area_ids: [],
                                                oecd_discipline_ids: [],
                                                oecd_knowledge_subarea_ids: [],
                                                research_focus_ids: [],
                                                snies_ids: [])
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
                                                oecd_knowledge_subarea_ids: [],
                                                research_focus_ids: [],
                                                snies_ids: [])
      end
    end
  end
end