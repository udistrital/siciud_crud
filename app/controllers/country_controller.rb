class CountryController < ApplicationController
  def index
    #render json: ISO3166::Country.all_translated(locale = "es")
  end

  def show
  end
end
