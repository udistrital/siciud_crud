require 'rails_helper'

RSpec.describe "TrainingCourses", type: :request do
  describe "GET /training_courses" do
    it "works! (now write some real specs)" do
      get training_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
