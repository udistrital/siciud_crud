module Api
  module V1
    class ProposalBudgetsController < AbstractProposalController
      include Swagger::ProposalBudgetApi

      before_action :set_proposal, only: [:create]
      before_action :set_proposal_budget, only: [:show, :update]

      # GET /proposal/:proposal_id/proposal_budgets
      # GET /proposal_budgets
      def index
        if params[:proposal_id]
          @proposal_budgets = CompleteProposalBudget.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @proposal_budgets = CompleteProposalBudget.all
        end
        @proposal_budgets = DxService.load(@proposal_budgets, params)

        render json: @proposal_budgets
      end

      # GET /proposal_budgets/1
      def show
        render json: @proposal_budget
      end

      # POST /proposal/:proposal_id/proposal_budgets
      def create
        @proposal_budget = @proposal.proposal_budgets.new(prop_budget_params_to_create)

        if @proposal_budget.save
          render json: @proposal_budget, status: :created
        else
          render json: @proposal_budget.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /proposal_budgets/1
      def update
        if @proposal_budget.update(prop_budget_params_to_update)
          render json: @proposal_budget
        else
          render json: @proposal_budget.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_proposal_budget
        @proposal_budget = ProposalBudget.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def prop_budget_params_to_create
        params.require(:proposal_budget).permit(:call_item_id, :amount_request_cidc,
                                                :counterparty, :amount_in_kind, :subtotal,
                                                :amount_executed, :balance, :active, :created_by)
      end

      def prop_budget_params_to_update
        params.require(:proposal_budget).permit(:call_item_id, :amount_request_cidc,
                                                :counterparty, :amount_in_kind, :subtotal,
                                                :proposal_id, :amount_executed, :balance,
                                                :active, :updated_by)
      end
    end
  end
end