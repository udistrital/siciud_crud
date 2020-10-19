require 'rails_helper'

RSpec.describe "CycleTypes", type: :request do
  describe "GET /cycle_types" do
    it "works! (now write some real specs)" do
      get cycle_types_path
      expect(response).to have_http_status(200)
    end
  end
end
