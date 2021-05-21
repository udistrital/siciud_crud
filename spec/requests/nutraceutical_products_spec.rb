require 'rails_helper'

RSpec.describe "NutraceuticalProducts", type: :request do
  describe "GET /nutraceutical_products" do
    it "works! (now write some real specs)" do
      get nutraceutical_products_path
      expect(response).to have_http_status(200)
    end
  end
end
