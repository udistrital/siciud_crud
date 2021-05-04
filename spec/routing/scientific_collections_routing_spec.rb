require "rails_helper"

RSpec.describe ScientificCollectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/scientific_collections").to route_to("scientific_collections#index")
    end

    it "routes to #show" do
      expect(:get => "/scientific_collections/1").to route_to("scientific_collections#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/scientific_collections").to route_to("scientific_collections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scientific_collections/1").to route_to("scientific_collections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scientific_collections/1").to route_to("scientific_collections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scientific_collections/1").to route_to("scientific_collections#destroy", :id => "1")
    end
  end
end
