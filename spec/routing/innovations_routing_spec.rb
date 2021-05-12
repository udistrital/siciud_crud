require "rails_helper"

RSpec.describe InnovationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/innovations").to route_to("innovations#index")
    end

    it "routes to #show" do
      expect(:get => "/innovations/1").to route_to("innovations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/innovations").to route_to("innovations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/innovations/1").to route_to("innovations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/innovations/1").to route_to("innovations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/innovations/1").to route_to("innovations#destroy", :id => "1")
    end
  end
end
