require 'rails_helper'

RSpec.describe "ProfessionalRoles", type: :request do
  describe "GET /professional_roles" do
    it "works! (now write some real specs)" do
      get professional_roles_path
      expect(response).to have_http_status(200)
    end
  end
end
