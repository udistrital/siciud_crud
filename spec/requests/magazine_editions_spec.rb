require 'rails_helper'

RSpec.describe "MagazineEditions", type: :request do
  describe "GET /magazine_editions" do
    it "works! (now write some real specs)" do
      get magazine_editions_path
      expect(response).to have_http_status(200)
    end
  end
end
