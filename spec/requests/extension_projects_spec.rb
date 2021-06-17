require 'rails_helper'

RSpec.describe "ExtensionProjects", type: :request do
  describe "GET /extension_projects" do
    it "works! (now write some real specs)" do
      get extension_projects_path
      expect(response).to have_http_status(200)
    end
  end
end
