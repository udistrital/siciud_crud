require "rails_helper"

RSpec.describe NutraceuticalProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/nutraceutical_products").to route_to("nutraceutical_products#index")
    end

    it "routes to #show" do
      expect(:get => "/nutraceutical_products/1").to route_to("nutraceutical_products#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/nutraceutical_products").to route_to("nutraceutical_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/nutraceutical_products/1").to route_to("nutraceutical_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/nutraceutical_products/1").to route_to("nutraceutical_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nutraceutical_products/1").to route_to("nutraceutical_products#destroy", :id => "1")
    end
  end
end
