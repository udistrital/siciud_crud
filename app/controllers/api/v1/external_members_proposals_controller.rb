module Api
  module V1
    class ExternalMembersProposalsController < AbstractProposalController
      include Swagger::ExternalMembersProposalApi

      before_action :set_proposal, only: [:create]
      before_action :set_external_members_proposal, only: [:show, :update]

      # GET /proposal/:proposal_id/external_members_proposals
      def index
        @external_members_proposals = CompleteExtMembersProposal.all

        @external_members_proposals = DxService.load(@external_members_proposals,
                                                     params)

        render json: @external_members_proposals
      end

      # GET /external_members_proposals/1
      def show
        render json: @external_members_proposal
      end

      # POST /proposal/:proposal_id/external_members_proposals
      def create
        @external_members_proposal = @proposal.external_members_proposals.new(
          ext_mem_prl_params_to_create)

        if @external_members_proposal.save
          render json: @external_members_proposal, status: :created
        else
          render json: @external_members_proposal.errors,
                 status: :unprocessable_entity
        end
      end

      # PATCH/PUT /external_members_proposals/1
      def update
        if @external_members_proposal.update(
          ext_mem_prl_params_to_update)
          render json: @external_members_proposal
        else
          render json: @external_members_proposal.errors,
                 status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_external_members_proposal
        @external_members_proposal = ExternalMembersProposal.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ext_mem_prl_params_to_create
        params.require(:external_members_proposal).permit(:contact_id, :role_id,
                                                          :active, :created_by)
      end

      def ext_mem_prl_params_to_update
        params.require(:external_members_proposal).permit(:proposal_id,
                                                          :contact_id, :role_id,
                                                          :active, :updated_by)
      end
    end
  end
end