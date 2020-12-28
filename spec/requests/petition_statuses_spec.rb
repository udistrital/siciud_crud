require 'rails_helper'

RSpec.describe "PetitionStatuses", type: :request do
  describe "GET /petition_statuses" do
    it "works! (now write some real specs)" do
      get petition_statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
