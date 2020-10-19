require "rails_helper"

RSpec.describe NewAnimalBreedsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/new_animal_breeds").to route_to("new_animal_breeds#index")
    end

    it "routes to #show" do
      expect(:get => "/new_animal_breeds/1").to route_to("new_animal_breeds#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/new_animal_breeds").to route_to("new_animal_breeds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/new_animal_breeds/1").to route_to("new_animal_breeds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/new_animal_breeds/1").to route_to("new_animal_breeds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/new_animal_breeds/1").to route_to("new_animal_breeds#destroy", :id => "1")
    end
  end
end
