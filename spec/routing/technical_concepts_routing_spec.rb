require "rails_helper"

RSpec.describe TechnicalConceptsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/technical_concepts").to route_to("technical_concepts#index")
    end

    it "routes to #show" do
      expect(:get => "/technical_concepts/1").to route_to("technical_concepts#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/technical_concepts").to route_to("technical_concepts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/technical_concepts/1").to route_to("technical_concepts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/technical_concepts/1").to route_to("technical_concepts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/technical_concepts/1").to route_to("technical_concepts#destroy", :id => "1")
    end
  end
end
