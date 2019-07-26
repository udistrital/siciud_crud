require "city-state"

class CountryController < ApplicationController
  def index
    render json: ISO3166::Country.all_translated(locale = "es")
  end

  def show
    render json: CS.get(ISO3166::Country.find_country_by_name(params[:name]).alpha2)
  end

  private

  def country_params
  end
end
