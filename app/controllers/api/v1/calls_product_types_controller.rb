module Api
  module V1
    class CallsProductTypesController < ApplicationController
      before_action :set_call
      before_action :set_production, only: [:update, :destroy]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @call_product_type = @call.calls_product_types.order(:product_type_id)
        render json: @call_product_type
      end

      def create
        @call_product_type = @call.calls_product_types.new(call_product_params)

        if @call_product_type.save
          render json: @call_product_type, status: :created
        else
          render json: @call_product_type.errors, status: :unprocessable_entity
        end
      end

      def update
        if @call_product_type.update(call_product_update_params)
          render json: @call_product_type
        else
          render json: @call_product_type.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @call_product_type.destroy
      end

      private

      def call_product_params
        params.require(:calls_product_type).permit(:product_type_id, :required_type_id, :quantity)
      end

      def call_product_update_params
        params.require(:calls_product_type).permit(:required_type_id, :quantity)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end

      def set_production
        @call_product_type = @call.calls_product_types.find_by(id: params[:id])
        unless @call_product_type
          render json: {error: "Couldn't find call production with 'id'=#{params[:id]}"}
        end
      end
    end
  end
end
