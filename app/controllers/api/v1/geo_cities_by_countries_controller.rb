module Api
  module V1
    class GeoCitiesByCountriesController < ApplicationController
      before_action :set_geo_cities_by_country, only: [:show]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        params.permit(:geo_country_id)

        @geo_cities = GeoCitiesByCountry.where("geo_country_id = #{params[:geo_country_id]}")
        render json: @geo_cities.order(:name)
      end
    end
  end
end
