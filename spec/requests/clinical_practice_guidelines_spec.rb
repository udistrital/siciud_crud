require 'rails_helper'

RSpec.describe "ClinicalPracticeGuidelines", type: :request do
  describe "GET /clinical_practice_guidelines" do
    it "works! (now write some real specs)" do
      get clinical_practice_guidelines_path
      expect(response).to have_http_status(200)
    end
  end
end
