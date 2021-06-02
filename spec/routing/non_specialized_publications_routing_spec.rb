require "rails_helper"

RSpec.describe NonSpecializedPublicationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/non_specialized_publications").to route_to("non_specialized_publications#index")
    end

    it "routes to #show" do
      expect(:get => "/non_specialized_publications/1").to route_to("non_specialized_publications#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/non_specialized_publications").to route_to("non_specialized_publications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/non_specialized_publications/1").to route_to("non_specialized_publications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/non_specialized_publications/1").to route_to("non_specialized_publications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/non_specialized_publications/1").to route_to("non_specialized_publications#destroy", :id => "1")
    end
  end
end
