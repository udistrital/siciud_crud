module Api
  module V1
    class InternalMembersProposalsController < AbstractProposalController
      include Swagger::InternalMembersProposalApi

      before_action :set_proposal, only: [:create]
      before_action :set_internal_members_proposal, only: [:show, :update]

      # GET /proposal/:proposal_id/internal_members_proposals
      def index
        @internal_members_proposals = CompleteIntMembersProposal.all

        @internal_members_proposals = DxService.load(@internal_members_proposals,
                                                     params)

        render json: @internal_members_proposals
      end

      # GET /internal_members_proposals/1
      def show
        render json: @internal_members_proposal
      end

      # POST /proposal/:proposal_id/internal_members_proposals
      def create
        @internal_members_proposal = @proposal.internal_members_proposals.new(
          int_mem_prl_params_to_create)

        if @internal_members_proposal.save
          render json: @internal_members_proposal, status: :created
        else
          render json: @internal_members_proposal.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /internal_members_proposals/1
      def update
        if @internal_members_proposal.update(int_mem_prl_params_to_update)
          render json: @internal_members_proposal
        else
          render json: @internal_members_proposal.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_internal_members_proposal
        @internal_members_proposal = InternalMembersProposal.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def int_mem_prl_params_to_create
        params.require(:internal_members_proposal).permit(:researcher_id,
                                                          :role_id,
                                                          :active, :created_by)
      end

      def int_mem_prl_params_to_update
        params.require(:internal_members_proposal).permit(:proposal_id,
                                                          :researcher_id, :role_id,
                                                          :active, :updated_by)
      end
    end
  end
end