require "rails_helper"

RSpec.describe IndustrialDesignsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/industrial_designs").to route_to("industrial_designs#index")
    end

    it "routes to #show" do
      expect(:get => "/industrial_designs/1").to route_to("industrial_designs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/industrial_designs").to route_to("industrial_designs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/industrial_designs/1").to route_to("industrial_designs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/industrial_designs/1").to route_to("industrial_designs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/industrial_designs/1").to route_to("industrial_designs#destroy", :id => "1")
    end
  end
end
