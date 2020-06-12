module Api
  module V1
    class ProductTypesController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @product_type = ProductType.all.order(:id)
        render json: @product_type
      end
    end
  end
end
