require 'rails_helper'

RSpec.describe "AppropriationProcesses", type: :request do
  describe "GET /appropriation_processes" do
    it "works! (now write some real specs)" do
      get appropriation_processes_path
      expect(response).to have_http_status(200)
    end
  end
end
