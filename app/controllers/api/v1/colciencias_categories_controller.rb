module Api
  module V1
    class ColcienciasCategoriesController < ApplicationController
      before_action :set_colc_category, only: [:update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @colciencias_category = ColcienciasCategory.all.order(:name)
        render json: @colciencias_category, status: :ok
      end

      def create
        @colciencias_category = ColcienciasCategory.new(colc_cat_params)
        if @colciencias_category.save
          render json: @colciencias_category, status: :created
        else
          render json: @colciencias_category.errors, status: :unprocessable_entity
        end
      end

      def update
        if @colciencias_category.update(colc_cat_params)
          render json: @colciencias_category, status: :ok
        else
          render json: @colciencias_category.errors, status: :unprocessable_entity
        end
      end

      private

      def colc_cat_params
        params.require(:colciencias_category).permit(:name)
      end

      def set_colc_category
        @colciencias_category = ColcienciasCategory.find(params["id"])
      end
    end
  end
end
