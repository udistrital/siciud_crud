require "rails_helper"

RSpec.describe KnowledgeNetworksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/knowledge_networks").to route_to("knowledge_networks#index")
    end

    it "routes to #show" do
      expect(:get => "/knowledge_networks/1").to route_to("knowledge_networks#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/knowledge_networks").to route_to("knowledge_networks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/knowledge_networks/1").to route_to("knowledge_networks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/knowledge_networks/1").to route_to("knowledge_networks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/knowledge_networks/1").to route_to("knowledge_networks#destroy", :id => "1")
    end
  end
end
