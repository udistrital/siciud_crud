require 'rails_helper'

RSpec.describe "ExtParticipants", type: :request do
  describe "GET /ext_participants" do
    it "works! (now write some real specs)" do
      get ext_participants_path
      expect(response).to have_http_status(200)
    end
  end
end
