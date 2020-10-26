require 'rails_helper'

RSpec.describe "PaperTypes", type: :request do
  describe "GET /paper_types" do
    it "works! (now write some real specs)" do
      get paper_types_path
      expect(response).to have_http_status(200)
    end
  end
end
