require 'rails_helper'

RSpec.describe "IpLivestockBreeds", type: :request do
  describe "GET /ip_livestock_breeds" do
    it "works! (now write some real specs)" do
      get ip_livestock_breeds_path
      expect(response).to have_http_status(200)
    end
  end
end
