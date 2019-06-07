require 'rails_helper'

RSpec.describe "PlanPeriods", type: :request do
  describe "GET /plan_periods" do
    it "works! (now write some real specs)" do
      get plan_periods_path
      expect(response).to have_http_status(200)
    end
  end
end
