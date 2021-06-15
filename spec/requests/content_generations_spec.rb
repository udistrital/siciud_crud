require 'rails_helper'

RSpec.describe "ContentGenerations", type: :request do
  describe "GET /content_generations" do
    it "works! (now write some real specs)" do
      get content_generations_path
      expect(response).to have_http_status(200)
    end
  end
end
