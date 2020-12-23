require 'rails_helper'

RSpec.describe "IntParticipants", type: :request do
  describe "GET /int_participants" do
    it "works! (now write some real specs)" do
      get int_participants_path
      expect(response).to have_http_status(200)
    end
  end
end
