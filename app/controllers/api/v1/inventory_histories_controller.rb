module Api
  module V1
    class InventoryHistoriesController < ApplicationController
      before_action :set_inventory_history, only: [:show, :update]

      # GET /inventory_histories
      def index
        @inventory_histories = InventoryHistory.all

        render json: @inventory_histories
      end

      # GET /inventory_histories/1
      def show
        render json: @inventory_history
      end

      # POST /inventory_histories
      def create
        @inventory_history = InventoryHistory.new(inventory_history_params)

        if @inventory_history.save
          render json: @inventory_history, status: :created
        else
          render json: @inventory_history.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /inventory_histories/1
      def update
        if @inventory_history.update(inventory_history_params)
          render json: @inventory_history
        else
          render json: @inventory_history.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_inventory_history
        @inventory_history = InventoryHistory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def inventory_history_params
        params.require(:inventory_history).permit(:form_e_act_plan_id, :state_id,
                                                  :usable_id, :usable_type, :active,
                                                  :created_by, :updated_by)
      end
    end
  end
end