require "rails_helper"

RSpec.describe EditorialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/editorials").to route_to("editorials#index")
    end

    it "routes to #show" do
      expect(:get => "/editorials/1").to route_to("editorials#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/editorials").to route_to("editorials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/editorials/1").to route_to("editorials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/editorials/1").to route_to("editorials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/editorials/1").to route_to("editorials#destroy", :id => "1")
    end
  end
end
