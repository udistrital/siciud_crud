require 'rails_helper'

RSpec.describe "KnwlSpecAreas", type: :request do
  describe "GET /knwl_spec_areas" do
    it "works! (now write some real specs)" do
      get knwl_spec_areas_path
      expect(response).to have_http_status(200)
    end
  end
end
