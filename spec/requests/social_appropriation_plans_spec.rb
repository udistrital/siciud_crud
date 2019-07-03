require 'rails_helper'

RSpec.describe "SocialAppropriationPlans", type: :request do
  describe "GET /social_appropriation_plans" do
    it "works! (now write some real specs)" do
      get social_appropriation_plans_path
      expect(response).to have_http_status(200)
    end
  end
end
