module Api
  module V1
    class ProductTypesController < ApplicationController
      before_action :set_product_type, only: [:show, :update]

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

      def show
        render json: @product_type
      end


      def create
        @product_type = ProductType.new(product_type_params)
        if @product_type.save
          render json: @product_type, status: :created
        else
          render json: @product_type.errors, status: :unprocessable_entity
        end
      end


      def update
        if @product_type.update(product_type_params)
          render json: @product_type
        else
          render json: @product_type.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product_type
        @product_type = ProductType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_type_params
        params.require(:product_type).permit(:name, :product_typology_id)
      end
    end
  end
end
