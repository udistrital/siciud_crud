require "rails_helper"

RSpec.describe IdiInvestigationProjectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/idi_investigation_projects").to route_to("idi_investigation_projects#index")
    end

    it "routes to #show" do
      expect(:get => "/idi_investigation_projects/1").to route_to("idi_investigation_projects#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/idi_investigation_projects").to route_to("idi_investigation_projects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/idi_investigation_projects/1").to route_to("idi_investigation_projects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/idi_investigation_projects/1").to route_to("idi_investigation_projects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/idi_investigation_projects/1").to route_to("idi_investigation_projects#destroy", :id => "1")
    end
  end
end
