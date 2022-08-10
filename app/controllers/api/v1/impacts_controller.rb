module Api
  module V1
    class ImpactsController < AbstractProposalController
      include Swagger::ImpactApi

      before_action :set_proposal, only: [:create]
      before_action :set_impact, only: [:show, :update]

      # GET /proposal/:proposal_id/impacts
      def index
        if params[:proposal_id]
          @impacts = CompleteImpact.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @impacts = CompleteImpact.all
        end
        @impacts = DxService.load(@impacts, params)

        render json: @impacts
      end

      # GET /impacts/1
      def show
        render json: @impact
      end

      # POST /proposal/:proposal_id/impacts
      def create
        @impact = @proposal.impacts.new(impact_params_to_create)

        if @impact.save
          render json: @impact, status: :created
        else
          render json: @impact.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /impacts/1
      def update
        if @impact.update(impact_params_to_update)
          render json: @impact
        else
          render json: @impact.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_impact
        @impact = Impact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def impact_params_to_create
        params.require(:impact).permit(:impact_type_id, :indicator_id, :description,
                                       :goal, :term_id, :active, :created_by)
      end

      def impact_params_to_update
        params.require(:impact).permit(:impact_type_id, :indicator_id, :description,
                                       :goal, :term_id, :proposal_id, :active, :updated_by)
      end
    end
  end
end