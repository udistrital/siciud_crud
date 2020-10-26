require "rails_helper"

RSpec.describe CycleTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/cycle_types").to route_to("cycle_types#index")
    end

    it "routes to #show" do
      expect(:get => "/cycle_types/1").to route_to("cycle_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/cycle_types").to route_to("cycle_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cycle_types/1").to route_to("cycle_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cycle_types/1").to route_to("cycle_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cycle_types/1").to route_to("cycle_types#destroy", :id => "1")
    end
  end
end
