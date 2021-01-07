module Api
  module V1
    class CategoriesController < ApplicationController
      include Swagger::CategoryApi

      before_action :set_category, only: [:show, :update]

      # GET /categories
      def index
        params.permit(:product_type_id)
        @categories = Category.all
        if (pro_type_id = params[:product_type_id])
          @categories = @categories.where("product_type_id = #{pro_type_id}")
        end

        render json: @categories
      end

      # GET /categories/1
      def show
        render json: @category
      end

      # POST /categories
      def create
        @category = Category.new(category_params)

        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name, :product_type_id)
      end
    end
  end
end
