module Api
  module V1
    class GeoStatesController < ApplicationController
      before_action :set_geo_country
      before_action :set_geo_state, only: [:show]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /geo_countries/:id/geo_states
      def index
        @geo_states = @geo_country.geo_states.order(:name)

        render json: @geo_states
      end

      # GET /geo_countries/:id/geo_states/1
      def show
        render json: @geo_state
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_geo_country
        @geo_country = GeoCountry.find(params[:geo_country_id])
      end

      def set_geo_state
        @geo_state = GeoState.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def geo_state_params
        params.require(:geo_state).permit(:name, :code)
      end
    end
  end
end
