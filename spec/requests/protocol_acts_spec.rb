require 'rails_helper'

RSpec.describe "ProtocolActs", type: :request do
  describe "GET /protocol_acts" do
    it "works! (now write some real specs)" do
      get protocol_acts_path
      expect(response).to have_http_status(200)
    end
  end
end
