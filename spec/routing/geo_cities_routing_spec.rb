require "rails_helper"

RSpec.describe GeoCitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/geo_cities").to route_to("geo_cities#index")
    end

    it "routes to #show" do
      expect(:get => "/geo_cities/1").to route_to("geo_cities#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/geo_cities").to route_to("geo_cities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/geo_cities/1").to route_to("geo_cities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/geo_cities/1").to route_to("geo_cities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/geo_cities/1").to route_to("geo_cities#destroy", :id => "1")
    end
  end
end
