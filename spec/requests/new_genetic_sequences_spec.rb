require 'rails_helper'

RSpec.describe "NewGeneticSequences", type: :request do
  describe "GET /new_genetic_sequences" do
    it "works! (now write some real specs)" do
      get new_genetic_sequences_path
      expect(response).to have_http_status(200)
    end
  end
end
