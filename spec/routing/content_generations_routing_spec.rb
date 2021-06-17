require "rails_helper"

RSpec.describe ContentGenerationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/content_generations").to route_to("content_generations#index")
    end

    it "routes to #show" do
      expect(:get => "/content_generations/1").to route_to("content_generations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/content_generations").to route_to("content_generations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/content_generations/1").to route_to("content_generations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/content_generations/1").to route_to("content_generations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/content_generations/1").to route_to("content_generations#destroy", :id => "1")
    end
  end
end
