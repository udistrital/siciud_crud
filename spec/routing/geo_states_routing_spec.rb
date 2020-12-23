require "rails_helper"

RSpec.describe GeoStatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/geo_states").to route_to("geo_states#index")
    end

    it "routes to #show" do
      expect(:get => "/geo_states/1").to route_to("geo_states#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/geo_states").to route_to("geo_states#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/geo_states/1").to route_to("geo_states#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/geo_states/1").to route_to("geo_states#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/geo_states/1").to route_to("geo_states#destroy", :id => "1")
    end
  end
end
