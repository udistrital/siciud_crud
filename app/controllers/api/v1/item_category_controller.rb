module Api
  module V1
    class ItemCategoryController < ApplicationController
      before_action :set_item_category, only: [:show, :update]
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        #Listar todas las facultades
        @item_categories = ItemCategory.all
        render json: @item_categories
      end

      #Listar en detalle una facultad
      def show
        render json: @item_category
      end

      def create
        @item_category = ItemCategory.new(item_category_params)
        if @item_category.save
          render json: @item_category, status: :created
        else
          render json: @item_category.errors, status: :unprocessable_entity
        end
      end

      def update
        if @item_category.update(funding_entity)
          render json: @item_category
        else
          render json: @item_category.errors, status: :unprocessable_entity
        end
      end

      private

      def set_item_category
        @item_category = ItemCategory.find(params[:id])
      end

      def item_category_params
        params.require(:item_category).permit(:name)
      end
    end
  end
end
