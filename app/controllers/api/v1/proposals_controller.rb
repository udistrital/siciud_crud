module Api
  module V1
    class ProposalsController < AbstractCallController
      include Swagger::ProposalApi

      before_action :set_call, only: [:create]
      before_action :set_proposal, only: [:show, :update]

      # GET /calls/:call_id/proposals
      # GET /proposals
      def index
        if params[:call_id]
          @proposals = CompleteProposal.where(
            "call_id = ?", params[:call_id]
          )
        else
          @proposals = CompleteProposal.all
        end

        @proposals = DxService.load(@proposals, params)

        render json: @proposals
      end

      def index_by_researcher
        if params[:researcher_id]
          @proposals = CompleteProposalsByIntMember.where(
            "researcher_id = ?", params[:researcher_id]
          )
        elsif params[:researcher_identification]
          @proposals = CompleteProposalsByIntMember.where(
            "researcher_identification = ?", params[:researcher_identification]
          )
        else
          @proposals = CompleteProposalsByIntMember.none
        end

        @proposals = DxService.load(@proposals, params)

        render json: @proposals
      end

      # GET /proposals/1
      def show
        render json: @proposal
      end

      # POST /calls/:call_id/proposals
      def create
        Proposal.transaction do
          @proposal = @call.proposals.new(
            proposal_params_to_create.except(:entity_ids,
                                             :dependency_ids,
                                             :research_group_ids)
          )

          if @proposal.save
            @proposal = save_supplementary_data(@proposal)
            render json: @proposal, status: :created
          else
            render json: @proposal.errors, status: :unprocessable_entity
          end
        end
      end

      # PATCH/PUT /proposals/1
      def update
        if @proposal.update(proposal_params_to_update)
          render json: @proposal
        else
          render json: @proposal.errors, status: :unprocessable_entity
        end
      end

      private

      def save_supplementary_data(proposal)
        if params[:proposal].has_key?(:entity_ids)
          proposal.entity_ids = (params[:proposal][:entity_ids]).map(&:to_i).uniq
        end
        if params[:proposal].has_key?(:dependency_ids)
          proposal.dependency_ids = (params[:proposal][:dependency_ids]).map(&:to_i).uniq
        end
        proposal
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_proposal
        @proposal = Proposal.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def proposal_params_to_create
        params.require(:proposal).permit(:title, :description, :duration,
                                         :proposal_status_id, :project_type_id,
                                         :total_amount_in_kind, :total_amount_request_cidc,
                                         :total_counterparty, :active, :created_by,
                                         entity_ids: [], dependency_ids: [])
      end

      def proposal_params_to_update
        params.require(:proposal).permit(:title, :description, :duration,
                                         :proposal_status_id, :project_type_id,
                                         :call_id, :total_amount_in_kind, :total_amount_request_cidc,
                                         :total_counterparty, :active, :updated_by,
                                         entity_ids: [], dependency_ids: [])
      end
    end
  end
end