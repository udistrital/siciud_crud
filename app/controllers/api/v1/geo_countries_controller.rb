module Api
  module V1
    class GeoCountriesController < ApplicationController
      include Swagger::GeoCountryApi

      before_action :set_geo_country, only: [:show]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /geo_countries
      def index
        @geo_countries = GeoCountry.all.order(:name)

        render json: @geo_countries
      end

      # GET /geo_countries/1
      def show
        render json: @geo_country
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_geo_country
        @geo_country = GeoCountry.find(params[:id])
      end
    end
  end
end