require "rails_helper"

RSpec.describe GeoCountriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/geo_countries").to route_to("geo_countries#index")
    end

    it "routes to #show" do
      expect(:get => "/geo_countries/1").to route_to("geo_countries#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/geo_countries").to route_to("geo_countries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/geo_countries/1").to route_to("geo_countries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/geo_countries/1").to route_to("geo_countries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/geo_countries/1").to route_to("geo_countries#destroy", :id => "1")
    end
  end
end
