require 'rails_helper'

RSpec.describe "TechnicalConcepts", type: :request do
  describe "GET /technical_concepts" do
    it "works! (now write some real specs)" do
      get technical_concepts_path
      expect(response).to have_http_status(200)
    end
  end
end
