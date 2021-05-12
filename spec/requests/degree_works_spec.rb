require 'rails_helper'

RSpec.describe "DegreeWorks", type: :request do
  describe "GET /degree_works" do
    it "works! (now write some real specs)" do
      get degree_works_path
      expect(response).to have_http_status(200)
    end
  end
end
