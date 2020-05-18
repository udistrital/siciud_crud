require "city-state"

module Api
  module V1
    class CountryController < ApplicationController
      include Swagger::CountryApi

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      rescue_from StandardError do |exception|
        render json: {error: "No se cuenta con la informacion de las ciudades de este pais: #{exception.class} - #{exception.message}"}
      end

      def index
        render json: ISO3166::Country.all_translated(locale = "es")
      end

      def show
        render json: CS.get(ISO3166::Country.find_country_by_name(params[:name]).alpha2)
      end
    end
  end
end
