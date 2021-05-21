require 'rails_helper'

RSpec.describe "ScientificCollections", type: :request do
  describe "GET /scientific_collections" do
    it "works! (now write some real specs)" do
      get scientific_collections_path
      expect(response).to have_http_status(200)
    end
  end
end
