require 'rails_helper'

RSpec.describe "VegetableVarieties", type: :request do
  describe "GET /vegetable_varieties" do
    it "works! (now write some real specs)" do
      get vegetable_varieties_path
      expect(response).to have_http_status(200)
    end
  end
end
