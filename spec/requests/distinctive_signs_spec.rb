require 'rails_helper'

RSpec.describe "DistinctiveSigns", type: :request do
  describe "GET /distinctive_signs" do
    it "works! (now write some real specs)" do
      get distinctive_signs_path
      expect(response).to have_http_status(200)
    end
  end
end
