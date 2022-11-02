module Api
  module V1
    class FormEActPlansController < AbstractActionPlanController
      include Swagger::FormEActPlanApi

      before_action :set_action_plan_to_form, only: [:create, :update]
      before_action :set_proposal, only: [:create_inventory, :update_inventory]
      before_action :set_form_e_act_plan, only: [:show, :update, :update_inventory]

      # GET /action_plans/:id/form_e_act_plans
      # GET /proposals/:id/inventories
      # GET /inventories
      def index
        if params[:action_plan_id]
          @form_e_act_plans = CompleteFormEActP.where(
            "action_plan_id = ?", params[:action_plan_id]
          )
        elsif params[:proposal_id]
          @form_e_act_plans = CompleteFormEActP.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @form_e_act_plans = CompleteFormEActP.all
        end
        @form_e_act_plans = DxService.load(@form_e_act_plans, params)

        render json: @form_e_act_plans
      end

      # GET /form_e_act_plans/1
      # GET /inventories/1
      def show
        render json: @form_e_act_plan
      end

      # POST /action_plans/:id/form_e_act_plans
      def create
        @form_e_act_plan = @action_plan.form_e_act_plans.new(
          form_e_act_p_params_to_create.except(:proposal_id))

        if @form_e_act_plan.save
          render json: @form_e_act_plan, status: :created
        else
          render json: @form_e_act_plan.errors, status: :unprocessable_entity
        end
      end

      # POST /inventories
      def create_inventory
        @form_e_act_plan = FormEActPlan.new(
          form_e_act_p_params_to_create.except(:proposal_id))

        if @form_e_act_plan.save
          create_inventory_history(@form_e_act_plan.id,
                                   @form_e_act_plan.state_id,
                                   @form_e_act_plan.created_by
                                   )
          render json: @form_e_act_plan, status: :created
        else
          render json: @form_e_act_plan.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /form_e_act_plans/1
      def update
        result = ActionPlanService.form_is_upgradeable(@action_plan,
                                                       @form_e_act_plan,
                                                       form_e_act_p_params_to_update.except(:proposal_id),
                                                       [
                                                         :classification_id,
                                                         :type_description, :description,
                                                         :inventoried, :inventory_plate,
                                                         :plan_type_id, :value, :state_id],
                                                       ", form e.")
        if result[:is_upgradeable]
          if @form_e_act_plan.update(result[:body_params])
            render json: @form_e_act_plan
          else
            render json: @form_e_act_plan.errors, status: :unprocessable_entity
          end
        else
          render json: { error: result[:msg] },
                 status: :unprocessable_entity
        end
      end

      # PATCH/PUT /inventories/1
      def update_inventory
        if @form_e_act_plan.update(form_e_act_p_params_to_update.except(:proposal_id))
          if @proposal.inventory_histories.find_by(form_e_act_plan_id: @form_e_act_plan.id).nil?
            create_inventory_history(@form_e_act_plan.id,
                                     @form_e_act_plan.state_id,
                                     @form_e_act_plan.created_by
            )
          else
            update_inventory_history(@form_e_act_plan.id,
                                     @form_e_act_plan.state_id,
                                     @form_e_act_plan.updated_by
            )
          end
          render json: @form_e_act_plan
        else
          render json: @form_e_act_plan.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_form_e_act_plan
        @form_e_act_plan = FormEActPlan.find(params[:id])
      end

      def set_proposal
        @proposal = Proposal.find(form_e_act_p_params_to_create[:proposal_id])
      end

      def create_inventory_history(form_e_act_plan_id, state_id, created_by)
        inventory_history = @proposal.inventory_histories.new(
          form_e_act_plan_id: form_e_act_plan_id,
          state_id: state_id,
          created_by: created_by
        )
        inventory_history.save
      end

      def update_inventory_history(form_e_act_plan_id, state_id, updated_by)
        @inventory_history = @proposal.inventory_histories.find_by(
          form_e_act_plan_id: form_e_act_plan_id)
        unless @inventory_history.nil?
          @inventory_history.update(
            state_id: state_id,
            updated_by: updated_by
          )
        end
      end

      # Only allow a trusted parameter "white list" through.
      def form_e_act_p_params_to_create
        params.require(:form_e_act_plan).permit(:classification_id, :type_description,
                                                :description, :inventoried, :value,
                                                :inventory_plate, :plan_type_id, :state_id,
                                                :proposal_id, :active, :created_by)
      end

      def form_e_act_p_params_to_update
        params.require(:form_e_act_plan).permit(:classification_id, :type_description,
                                                :description, :inventoried,
                                                :inventory_plate, :action_plan_id,
                                                :plan_type_id, :value, :state_id,
                                                :proposal_id, :active, :updated_by)
      end
    end
  end
end