module Api
  module V1
    class BillsController < AbstractProductResearchUnitController
      include Swagger::BillApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_bill, only: [:show, :update]

      # GET /research_units/:id/bills
      def index
        @bills = CompleteBill.where(
          research_group_id: params[:research_group_id])
        @bills = DxService.load(@bills, params)

        render json: @bills
      end

      # GET /bills/1
      def show
        render json: @bill
      end

      # POST /research_units/:id/bills
      def create
        @bill = @research_group.bills.new(bill_params_to_create)

        if @bill.save
          render json: @bill, status: :created
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /bills/1
      def update
        if @bill.update(bill_params_to_update)
          render json: @bill
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_bill
        @bill = Bill.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def bill_params_to_create
        params.require(:bill).permit(:title, :category_id, :research_group_id,
                                     :colciencias_call_id, :observation, :active,
                                     :created_by)
      end

      def bill_params_to_update
        params.require(:bill).permit(:title, :category_id, :research_group_id,
                                     :colciencias_call_id, :observation, :active,
                                     :updated_by)
      end
    end
  end
end