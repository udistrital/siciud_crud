require 'rails_helper'

RSpec.describe "PatentStates", type: :request do
  describe "GET /patent_states" do
    it "works! (now write some real specs)" do
      get patent_states_path
      expect(response).to have_http_status(200)
    end
  end
end
