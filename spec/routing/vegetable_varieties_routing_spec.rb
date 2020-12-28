require "rails_helper"

RSpec.describe VegetableVarietiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/vegetable_varieties").to route_to("vegetable_varieties#index")
    end

    it "routes to #show" do
      expect(:get => "/vegetable_varieties/1").to route_to("vegetable_varieties#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vegetable_varieties").to route_to("vegetable_varieties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vegetable_varieties/1").to route_to("vegetable_varieties#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vegetable_varieties/1").to route_to("vegetable_varieties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vegetable_varieties/1").to route_to("vegetable_varieties#destroy", :id => "1")
    end
  end
end
