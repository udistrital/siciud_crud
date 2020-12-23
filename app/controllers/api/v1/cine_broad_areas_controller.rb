module Api
  module V1
    class CineBroadAreasController < ApplicationController
      before_action :set_broad_area, only: [:update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @cine_broad_area = CineBroadArea.all.order(:code)
        render json: @cine_broad_area
      end

      def create
        @cine_broad_area = CineBroadArea.new(broad_area_params)
        if @cine_broad_area.save
          render json: @cine_broad_area, status: :created
        else
          render json: @cine_broad_area.errors, status: :unprocessable_entity
        end
      end

      def update
        if @cine_broad_area.update(broad_area_params)
          render json: @cine_broad_area, status: :ok
        else
          render json: @cine_broad_area.errors, status: :unprocessable_entity
        end
      end

      private

      def broad_area_params
        params.require(:cine_broad_area).permit(:name, :code)
      end

      def set_broad_area
        @cine_broad_area = CineBroadArea.find(params[:id])
      end
    end
  end
end
