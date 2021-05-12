require "rails_helper"

RSpec.describe PlantIndPrototypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/plant_ind_prototypes").to route_to("plant_ind_prototypes#index")
    end

    it "routes to #show" do
      expect(:get => "/plant_ind_prototypes/1").to route_to("plant_ind_prototypes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/plant_ind_prototypes").to route_to("plant_ind_prototypes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/plant_ind_prototypes/1").to route_to("plant_ind_prototypes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plant_ind_prototypes/1").to route_to("plant_ind_prototypes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plant_ind_prototypes/1").to route_to("plant_ind_prototypes#destroy", :id => "1")
    end
  end
end
