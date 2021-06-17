require 'rails_helper'

RSpec.describe "IdiInvestigationProjects", type: :request do
  describe "GET /idi_investigation_projects" do
    it "works! (now write some real specs)" do
      get idi_investigation_projects_path
      expect(response).to have_http_status(200)
    end
  end
end
