require 'rails_helper'

RSpec.describe "GeoCountries", type: :request do
  describe "GET /geo_countries" do
    it "works! (now write some real specs)" do
      get geo_countries_path
      expect(response).to have_http_status(200)
    end
  end
end
