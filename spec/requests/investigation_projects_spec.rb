require 'rails_helper'

RSpec.describe "InvestigationProjects", type: :request do
  describe "GET /investigation_projects" do
    it "works! (now write some real specs)" do
      get investigation_projects_path
      expect(response).to have_http_status(200)
    end
  end
end
