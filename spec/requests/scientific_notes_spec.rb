require 'rails_helper'

RSpec.describe "ScientificNotes", type: :request do
  describe "GET /scientific_notes" do
    it "works! (now write some real specs)" do
      get scientific_notes_path
      expect(response).to have_http_status(200)
    end
  end
end
