require 'rails_helper'

RSpec.describe "PlantIndPrototypes", type: :request do
  describe "GET /plant_ind_prototypes" do
    it "works! (now write some real specs)" do
      get plant_ind_prototypes_path
      expect(response).to have_http_status(200)
    end
  end
end
