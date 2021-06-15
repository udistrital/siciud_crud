require 'rails_helper'

RSpec.describe "AccompanimentConsultancies", type: :request do
  describe "GET /accompaniment_consultancies" do
    it "works! (now write some real specs)" do
      get accompaniment_consultancies_path
      expect(response).to have_http_status(200)
    end
  end
end
