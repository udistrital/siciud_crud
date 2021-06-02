require 'rails_helper'

RSpec.describe "Consultancies", type: :request do
  describe "GET /consultancies" do
    it "works! (now write some real specs)" do
      get consultancies_path
      expect(response).to have_http_status(200)
    end
  end
end
