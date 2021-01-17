module Api
  module V1
    class KnwlSpecAreasController < ApplicationController
      include Swagger::KnwlSpecAreaApi

      before_action :set_knwl_spec_area, only: [:show, :update]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /knwl_spec_areas
      def index
        @knwl_spec_areas = KnwlSpecArea.all

        render json: @knwl_spec_areas
      end

      # GET /knwl_spec_areas/1
      def show
        render json: @knwl_spec_area
      end

      # POST /knwl_spec_areas
      def create
        @knwl_spec_area = KnwlSpecArea.new(knwl_spec_area_params)

        if @knwl_spec_area.save
          render json: @knwl_spec_area, status: :created
        else
          render json: @knwl_spec_area.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /knwl_spec_areas/1
      def update
        if @knwl_spec_area.update(knwl_spec_area_params)
          render json: @knwl_spec_area
        else
          render json: @knwl_spec_area.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_knwl_spec_area
        @knwl_spec_area = KnwlSpecArea.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def knwl_spec_area_params
        params.require(:knwl_spec_area).permit(:name)
      end
    end
  end
end