module Api
  module V1
    class ItemDetailsController < AbstractProposalController
      include Swagger::ItemDetailApi

      before_action :set_proposal, only: [:create]
      before_action :set_item_detail, only: [:show, :update]

      # GET /proposals/:proposal_id/item_details
      # GET /proposal_budgets/:proposal_budget_id/item_details
      def index
        if params[:proposal_id]
          @item_details = CompleteItemDetail.where(
            "proposal_id = ?", params[:proposal_id]
          )
        elsif params[:proposal_budget_id]
          @item_details = CompleteItemDetail.where(
            "proposal_budget_id = ?", params[:proposal_budget_id]
          )
        else
          @item_details = CompleteItemDetail.all
        end
        @item_details = DxService.load(@item_details, params)

        render json: @item_details
      end

      # GET /item_details/1
      def show
        render json: @item_detail
      end

      # POST /proposals/:proposal_id/item_details
      def create
        @item_detail = @proposal.item_details.new(item_detail_params_to_create)

        if @item_detail.save
          render json: @item_detail, status: :created
        else
          render json: @item_detail.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /item_details/1
      def update
        if @item_detail.update(item_detail_params_to_update)
          render json: @item_detail
        else
          render json: @item_detail.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_item_detail
        @item_detail = ItemDetail.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def item_detail_params_to_create
        params.require(:item_detail).permit(:proposal_budget_id, :description,
                                            :justification, :estimated_date, :quantity,
                                            :individual_cost, :subtotal, :source_id,
                                            :state_id, :requested_amount,
                                            :executed_amount, :balance, :approved,
                                            :payments, :notified_due_to_expire,
                                            :notified_expired,
                                            :active, :created_by)
      end

      def item_detail_params_to_update
        params.require(:item_detail).permit(:proposal_budget_id, :description,
                                            :justification, :estimated_date, :quantity,
                                            :individual_cost, :subtotal, :proposal_id,
                                            :source_id, :state_id, :requested_amount,
                                            :executed_amount, :balance, :approved,
                                            :payments, :notified_due_to_expire,
                                            :notified_expired,
                                            :active, :updated_by)
      end
    end
  end
end