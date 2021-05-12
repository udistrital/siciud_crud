require 'rails_helper'

RSpec.describe "LicenseAgreements", type: :request do
  describe "GET /license_agreements" do
    it "works! (now write some real specs)" do
      get license_agreements_path
      expect(response).to have_http_status(200)
    end
  end
end
