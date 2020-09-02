module Api
  module V1
    class CineDetailedAreasController < ApplicationController
      before_action :set_detailed_area, only: [:update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @cine_detailed_area = CineDetailedArea.all.order(:code)
        render json: @cine_detailed_area
      end

      def create
        @cine_detailed_area = CineDetailedArea.new(detailed_area_params)
        if @cine_detailed_area.save
          render json: @cine_detailed_area, status: :created
        else
          render json: @cine_detailed_area.errors, status: :unprocessable_entity
        end
      end

      def update
        if @cine_detailed_area.update(detailed_area_params)
          render json: @cine_detailed_area, status: :ok
        else
          render json: @cine_detailed_area.errors, status: :unprocessable_entity
        end
      end

      private

      def detailed_area_params
        params.require(:cine_detailed_area).permit(:name, :code,
                                                   :cine_specific_area_id)
      end

      def set_detailed_area
        @cine_detailed_area = CineDetailedArea.find(params[:id])
      end
    end
  end
end
