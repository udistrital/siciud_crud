require 'rails_helper'

RSpec.describe "Patents", type: :request do
  describe "GET /patents" do
    it "works! (now write some real specs)" do
      get patents_path
      expect(response).to have_http_status(200)
    end
  end
end
