require 'rails_helper'

RSpec.describe "ResearcherFormationPlans", type: :request do
  describe "GET /researcher_formation_plans" do
    it "works! (now write some real specs)" do
      get researcher_formation_plans_path
      expect(response).to have_http_status(200)
    end
  end
end
