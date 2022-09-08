module Api
  module V1
    class ProposalEvaluationsController < AbstractProposalController

      before_action :set_proposal, only: [:create]
      before_action :set_proposal_evaluation, only: [:show, :update]

      # GET /proposals/:proposal_id/proposal_evaluations
      def index
        if params[:proposal_id]
          @proposal_evaluations = CompleteProposalEvaluation.where(
            "id = ?", params[:proposal_id]
          )
        else
          @proposal_evaluations = CompleteProposalEvaluation.all
        end
        @proposal_evaluations = DxService.load(@proposal_evaluations, params)

        render json: @proposal_evaluations
      end

      # GET /proposal_evaluations/1
      def show
        render json: @proposal_evaluation
      end

      # POST /proposals/:proposal_id/proposal_evaluations
      def create
        response, status = EvaluatorService.new_evaluation(@proposal, proposal_eval_params_to_create)
        render json: response, status: status
      end

      # PATCH/PUT /proposal_evaluations/1
      def update
        if @proposal_evaluation.update(proposal_eval_params_to_update)
          render json: @proposal_evaluation
        else
          render json: @proposal_evaluation.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_proposal_evaluation
        @proposal_evaluation = ProposalEvaluation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def proposal_eval_params_to_create
        params.require(:proposal_evaluation).permit(:created_by)
      end

      def proposal_eval_params_to_update
        params.require(:proposal_evaluation).permit(:proposal_id, :call_eval_criterion_id,
                                                    :value, :active, :updated_by)
      end

      #anonymous_evaluator_id
    end
  end
end