require 'rails_helper'

RSpec.describe "Innovations", type: :request do
  describe "GET /innovations" do
    it "works! (now write some real specs)" do
      get innovations_path
      expect(response).to have_http_status(200)
    end
  end
end
