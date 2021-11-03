module Api
  module V1
    class CallItemsController < AbstractCallController
      include Swagger::CallItemApi
      before_action :set_call, only: [:create]
      before_action :set_call_item, only: [:show, :update]

      # GET calls/:call_id/call_items
      def index
        @call_items = CompleteCallItem.where(
          "call_id = ?", params[:call_id]
        )
        @call_items = DxService.load(@call_items, params)

        render json: @call_items
      end

      # GET /call_items/1
      def show
        render json: @call_item
      end

      # POST calls/:call_id/call_items
      def create
        @call_item = @call.call_items.new(call_item_params_to_create)

        if @call_item.save
          render json: @call_item, status: :created
        else
          render json: @call_item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /call_items/1
      def update
        if @call_item.update(call_item_params_to_update)
          render json: @call_item
        else
          render json: @call_item.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_call_item
        @call_item = CallItem.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def call_item_params_to_create
        params.require(:call_item).permit(:item_id, :ci_maximum_percentage,
                                          :ci_percentage, :active, :created_by)
      end

      def call_item_params_to_update
        params.require(:call_item).permit(:call_id, :item_id,
                                          :ci_maximum_percentage, :ci_percentage,
                                          :active, :updated_by)
      end
    end
  end
end