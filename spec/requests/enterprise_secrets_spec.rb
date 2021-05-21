require 'rails_helper'

RSpec.describe "EnterpriseSecrets", type: :request do
  describe "GET /enterprise_secrets" do
    it "works! (now write some real specs)" do
      get enterprise_secrets_path
      expect(response).to have_http_status(200)
    end
  end
end
