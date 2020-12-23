module Api
  module V1
    class CineSpecificAreasController < ApplicationController
      before_action :set_specific_area, only: [:update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @cine_specific_area = CineSpecificArea.all.order(:code)
        render json: @cine_specific_area
      end

      def create
        @cine_specific_area = CineSpecificArea.new(specific_area_params)
        if @cine_specific_area.save
          render json: @cine_specific_area, status: :created
        else
          render json: @cine_specific_area.errors, status: :unprocessable_entity
        end
      end

      def update
        if @cine_specific_area.update(specific_area_params)
          render json: @cine_specific_area, status: :ok
        else
          render json: @cine_specific_area, status: :unprocessable_entity
        end
      end

      private

      def specific_area_params
        params.require(:cine_specific_area).permit(:name, :code,
                                                   :cine_broad_area_id)
      end

      def set_specific_area
        @cine_specific_area = CineSpecificArea.find(params[:id])
      end

    end
  end
end
