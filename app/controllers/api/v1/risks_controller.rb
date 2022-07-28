module Api
  module V1
    class RisksController < AbstractProposalController
      include Swagger::RiskApi

      before_action :set_proposal, only: [:create]
      before_action :set_risk, only: [:show, :update]

      # GET /proposal/:proposal_id/risks
      def index
        if params[:proposal_id]
          @risks = CompleteRisk.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @risks = CompleteRisk.all
        end
        @risks = DxService.load(@risks, params)

        render json: @risks
      end

      # GET /risks/1
      def show
        render json: @risk
      end

      # POST /proposal/:proposal_id/risks
      def create
        @risk = @proposal.risks.new(
          risk_params_to_create.except(:activity_schedule_ids))

        if @risk.save
          @risk = save_activities(@risk)
          render json: @risk, status: :created
        else
          render json: @risk.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /risks/1
      def update
        if @risk.update(risk_params_to_update)
          render json: @risk
        else
          render json: @risk.errors, status: :unprocessable_entity
        end
      end

      private

      def save_activities(risk)
        if params[:risk].has_key?(:activity_schedule_ids)
          risk.activity_schedule_ids = (params[:risk][:activity_schedule_ids]).map(&:to_i).uniq
        end
        risk
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_risk
        @risk = Risk.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def risk_params_to_create
        params.require(:risk).permit(:name, :consequence, :mitigation,
                                     :active, :created_by,
                                     activity_schedule_ids: [])
      end

      def risk_params_to_update
        params.require(:risk).permit(:name, :consequence, :mitigation,
                                     :proposal_id, :active, :updated_by,
                                     activity_schedule_ids: [])
      end
    end
  end
end