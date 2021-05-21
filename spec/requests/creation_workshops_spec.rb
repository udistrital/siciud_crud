require 'rails_helper'

RSpec.describe "CreationWorkshops", type: :request do
  describe "GET /creation_workshops" do
    it "works! (now write some real specs)" do
      get creation_workshops_path
      expect(response).to have_http_status(200)
    end
  end
end
