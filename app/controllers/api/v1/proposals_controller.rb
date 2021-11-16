module Api
  module V1
    class ProposalsController < AbstractCallController
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

      # GET /proposals/1
      def show
        render json: @proposal
      end

      # POST /calls/:call_id/proposals
      def create
        @proposal = @call.proposals.new(proposal_params_to_create)

        if @proposal.save
          render json: @proposal, status: :created
        else
          render json: @proposal.errors, status: :unprocessable_entity
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
      # Use callbacks to share common setup or constraints between actions.
      def set_proposal
        @proposal = Proposal.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def proposal_params_to_create
        params.require(:proposal).permit(:title, :description, :duration,
                                         :proposal_status_id, :project_type_id,
                                         :call_id, :geo_city_id, :geo_country_id,
                                         :geo_state_id, :active, :created_by,
                                         entity_ids: [], dependency_ids: [],
                                         research_group_ids: [])
      end

      def proposal_params_to_update
        params.require(:proposal).permit(:title, :description, :duration,
                                         :proposal_status_id, :project_type_id,
                                         :call_id, :geo_city_id, :geo_country_id,
                                         :geo_state_id, :active, :updated_by,
                                         entity_ids: [], dependency_ids: [],
                                         research_group_ids: [])
      end
    end
  end
end