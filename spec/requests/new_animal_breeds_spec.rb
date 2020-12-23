require 'rails_helper'

RSpec.describe "NewAnimalBreeds", type: :request do
  describe "GET /new_animal_breeds" do
    it "works! (now write some real specs)" do
      get new_animal_breeds_path
      expect(response).to have_http_status(200)
    end
  end
end
