module Api
  module V1
    class GeoCitiesController < ApplicationController
      include Swagger::GeoCityApi

      before_action :set_geo_state
      before_action :set_geo_city, only: [:show]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /geo_states/:id/geo_cities
      def index
        @geo_cities = @geo_state.geo_cities.order(:name)

        render json: @geo_cities
      end

      # GET /geo_states/:id/geo_cities/1
      def show
        render json: @geo_city
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_geo_city
        @geo_city = GeoCity.find(params[:id])
      end

      def set_geo_state
        @geo_state = GeoState.find(params[:geo_state_id])
      end

      # Only allow a trusted parameter "white list" through.
      def geo_city_params
        params.require(:geo_city).permit(:name, :code, :latitude, :longitude)
      end
    end

  end
end