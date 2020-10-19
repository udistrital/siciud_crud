require "rails_helper"

RSpec.describe PatentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/patents").to route_to("patents#index")
    end

    it "routes to #show" do
      expect(:get => "/patents/1").to route_to("patents#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/patents").to route_to("patents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/patents/1").to route_to("patents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/patents/1").to route_to("patents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/patents/1").to route_to("patents#destroy", :id => "1")
    end
  end
end
