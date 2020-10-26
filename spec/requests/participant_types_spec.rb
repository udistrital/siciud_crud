require 'rails_helper'

RSpec.describe "ParticipantTypes", type: :request do
  describe "GET /participant_types" do
    it "works! (now write some real specs)" do
      get participant_types_path
      expect(response).to have_http_status(200)
    end
  end
end
