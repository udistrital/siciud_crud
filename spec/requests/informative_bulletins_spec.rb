require 'rails_helper'

RSpec.describe "InformativeBulletins", type: :request do
  describe "GET /informative_bulletins" do
    it "works! (now write some real specs)" do
      get informative_bulletins_path
      expect(response).to have_http_status(200)
    end
  end
end
