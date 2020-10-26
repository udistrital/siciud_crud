require "rails_helper"

RSpec.describe ResearchCreationWorksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/research_creation_works").to route_to("research_creation_works#index")
    end

    it "routes to #show" do
      expect(:get => "/research_creation_works/1").to route_to("research_creation_works#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/research_creation_works").to route_to("research_creation_works#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/research_creation_works/1").to route_to("research_creation_works#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/research_creation_works/1").to route_to("research_creation_works#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/research_creation_works/1").to route_to("research_creation_works#destroy", :id => "1")
    end
  end
end
