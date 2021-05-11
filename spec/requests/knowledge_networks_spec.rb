require 'rails_helper'

RSpec.describe "KnowledgeNetworks", type: :request do
  describe "GET /knowledge_networks" do
    it "works! (now write some real specs)" do
      get knowledge_networks_path
      expect(response).to have_http_status(200)
    end
  end
end
