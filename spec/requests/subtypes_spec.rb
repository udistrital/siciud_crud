require 'rails_helper'

RSpec.describe "Subtypes", type: :request do
  describe "GET /subtypes" do
    it "works! (now write some real specs)" do
      get subtypes_path
      expect(response).to have_http_status(200)
    end
  end
end
