require "rails_helper"

RSpec.describe KnwlSpecAreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/knwl_spec_areas").to route_to("knwl_spec_areas#index")
    end

    it "routes to #show" do
      expect(:get => "/knwl_spec_areas/1").to route_to("knwl_spec_areas#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/knwl_spec_areas").to route_to("knwl_spec_areas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/knwl_spec_areas/1").to route_to("knwl_spec_areas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/knwl_spec_areas/1").to route_to("knwl_spec_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/knwl_spec_areas/1").to route_to("knwl_spec_areas#destroy", :id => "1")
    end
  end
end
