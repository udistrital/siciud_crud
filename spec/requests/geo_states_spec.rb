require 'rails_helper'

RSpec.describe "GeoStates", type: :request do
  describe "GET /geo_states" do
    it "works! (now write some real specs)" do
      get geo_states_path
      expect(response).to have_http_status(200)
    end
  end
end
