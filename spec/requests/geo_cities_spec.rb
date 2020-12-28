require 'rails_helper'

RSpec.describe "GeoCities", type: :request do
  describe "GET /geo_cities" do
    it "works! (now write some real specs)" do
      get geo_cities_path
      expect(response).to have_http_status(200)
    end
  end
end
