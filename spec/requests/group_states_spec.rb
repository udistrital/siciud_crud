require 'rails_helper'

RSpec.describe "GroupStates", type: :request do
  describe "GET /group_states" do
    it "works! (now write some real specs)" do
      get group_states_path
      expect(response).to have_http_status(200)
    end
  end
end
