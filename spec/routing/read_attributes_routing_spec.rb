require "rails_helper"

RSpec.describe ReadAttributesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/read_attributes").to route_to("read_attributes#index")
    end

    it "routes to #show" do
      expect(:get => "/read_attributes/1").to route_to("read_attributes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/read_attributes").to route_to("read_attributes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/read_attributes/1").to route_to("read_attributes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/read_attributes/1").to route_to("read_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/read_attributes/1").to route_to("read_attributes#destroy", :id => "1")
    end
  end
end
