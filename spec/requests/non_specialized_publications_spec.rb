require 'rails_helper'

RSpec.describe "NonSpecializedPublications", type: :request do
  describe "GET /non_specialized_publications" do
    it "works! (now write some real specs)" do
      get non_specialized_publications_path
      expect(response).to have_http_status(200)
    end
  end
end
