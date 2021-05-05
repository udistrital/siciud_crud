require "rails_helper"

RSpec.describe RegulationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/regulations").to route_to("regulations#index")
    end

    it "routes to #show" do
      expect(:get => "/regulations/1").to route_to("regulations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/regulations").to route_to("regulations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/regulations/1").to route_to("regulations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/regulations/1").to route_to("regulations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/regulations/1").to route_to("regulations#destroy", :id => "1")
    end
  end
end
