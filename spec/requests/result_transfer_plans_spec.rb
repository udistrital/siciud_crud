require 'rails_helper'

RSpec.describe "ResultTransferPlans", type: :request do
  describe "GET /result_transfer_plans" do
    it "works! (now write some real specs)" do
      get result_transfer_plans_path
      expect(response).to have_http_status(200)
    end
  end
end
