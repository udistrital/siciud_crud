require 'rails_helper'

RSpec.describe "WorkingPapers", type: :request do
  describe "GET /working_papers" do
    it "works! (now write some real specs)" do
      get working_papers_path
      expect(response).to have_http_status(200)
    end
  end
end
