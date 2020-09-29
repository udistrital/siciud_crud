require "rails_helper"

RSpec.describe GroupStatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/group_states").to route_to("group_states#index")
    end

    it "routes to #show" do
      expect(:get => "/group_states/1").to route_to("group_states#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/group_states").to route_to("group_states#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/group_states/1").to route_to("group_states#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/group_states/1").to route_to("group_states#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/group_states/1").to route_to("group_states#destroy", :id => "1")
    end
  end
end
