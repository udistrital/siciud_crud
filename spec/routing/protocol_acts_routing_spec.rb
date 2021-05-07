require "rails_helper"

RSpec.describe ProtocolActsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/protocol_acts").to route_to("protocol_acts#index")
    end

    it "routes to #show" do
      expect(:get => "/protocol_acts/1").to route_to("protocol_acts#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/protocol_acts").to route_to("protocol_acts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/protocol_acts/1").to route_to("protocol_acts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/protocol_acts/1").to route_to("protocol_acts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/protocol_acts/1").to route_to("protocol_acts#destroy", :id => "1")
    end
  end
end
