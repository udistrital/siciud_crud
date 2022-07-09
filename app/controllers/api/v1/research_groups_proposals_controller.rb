module Api
  module V1
    class ResearchGroupsProposalsController < AbstractProposalController
      include Swagger::ResearchGroupsProposalApi

      before_action :set_proposal, only: [:create]
      before_action :set_research_groups_proposal, only: [:show, :update]

      # GET /proposal/:proposal_id/research_groups_proposals
      def index
        if params[:proposal_id]
          @research_groups_proposals = CompleteResearchUnitProposal.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @research_groups_proposals = CompleteResearchUnitProposal.all
        end
        @research_groups_proposals = DxService.load(@research_groups_proposals,
                                                    params)
        render json: @research_groups_proposals
      end

      # GET /research_groups_proposals/1
      def show
        render json: @research_groups_proposal
      end

      # POST /proposal/:proposal_id/research_groups_proposals
      def create
        @research_groups_proposal = @proposal.research_groups_proposals.new(
          rg_proposal_params_to_create)

        if @research_groups_proposal.save
          render json: @research_groups_proposal, status: :created
        else
          render json: @research_groups_proposal.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_groups_proposals/1
      def update
        if @research_groups_proposal.update(rg_proposal_params_to_update)
          render json: @research_groups_proposal
        else
          render json: @research_groups_proposal.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_research_groups_proposal
        @research_groups_proposal = ResearchGroupsProposal.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def rg_proposal_params_to_create
        params.require(:research_groups_proposal).permit(:research_group_id,
                                                         :role_id, :active, :created_by)
      end

      def rg_proposal_params_to_update
        params.require(:research_groups_proposal).permit(:research_group_id, :proposal_id,
                                                         :role_id, :active, :updated_by)
      end
    end
  end
end