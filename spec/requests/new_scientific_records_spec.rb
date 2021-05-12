require 'rails_helper'

RSpec.describe "NewScientificRecords", type: :request do
  describe "GET /new_scientific_records" do
    it "works! (now write some real specs)" do
      get new_scientific_records_path
      expect(response).to have_http_status(200)
    end
  end
end
