require 'rails_helper'

RSpec.describe "GmStates", type: :request do
  describe "GET /gm_states" do
    it "works! (now write some real specs)" do
      get gm_states_path
      expect(response).to have_http_status(200)
    end
  end
end
