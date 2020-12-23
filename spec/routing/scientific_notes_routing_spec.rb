require "rails_helper"

RSpec.describe ScientificNotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/scientific_notes").to route_to("scientific_notes#index")
    end

    it "routes to #show" do
      expect(:get => "/scientific_notes/1").to route_to("scientific_notes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/scientific_notes").to route_to("scientific_notes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scientific_notes/1").to route_to("scientific_notes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scientific_notes/1").to route_to("scientific_notes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scientific_notes/1").to route_to("scientific_notes#destroy", :id => "1")
    end
  end
end
