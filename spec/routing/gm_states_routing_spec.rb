require "rails_helper"

RSpec.describe GmStatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/gm_states").to route_to("gm_states#index")
    end

    it "routes to #show" do
      expect(:get => "/gm_states/1").to route_to("gm_states#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/gm_states").to route_to("gm_states#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gm_states/1").to route_to("gm_states#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gm_states/1").to route_to("gm_states#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gm_states/1").to route_to("gm_states#destroy", :id => "1")
    end
  end
end
