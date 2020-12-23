require 'rails_helper'

RSpec.describe "ResearchCreationWorks", type: :request do
  describe "GET /research_creation_works" do
    it "works! (now write some real specs)" do
      get research_creation_works_path
      expect(response).to have_http_status(200)
    end
  end
end
