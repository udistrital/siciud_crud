require 'rails_helper'

RSpec.describe "TaskModels", type: :request do
  describe "GET /task_models" do
    it "works! (now write some real specs)" do
      get task_models_path
      expect(response).to have_http_status(200)
    end
  end
end
