require "rails_helper"

RSpec.describe GuideManualsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/guide_manuals").to route_to("guide_manuals#index")
    end

    it "routes to #show" do
      expect(:get => "/guide_manuals/1").to route_to("guide_manuals#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/guide_manuals").to route_to("guide_manuals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/guide_manuals/1").to route_to("guide_manuals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/guide_manuals/1").to route_to("guide_manuals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guide_manuals/1").to route_to("guide_manuals#destroy", :id => "1")
    end
  end
end
