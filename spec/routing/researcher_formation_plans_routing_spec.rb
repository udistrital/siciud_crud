require "rails_helper"

RSpec.describe ResearcherFormationPlansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/researcher_formation_plans").to route_to("researcher_formation_plans#index")
    end

    it "routes to #show" do
      expect(:get => "/researcher_formation_plans/1").to route_to("researcher_formation_plans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/researcher_formation_plans").to route_to("researcher_formation_plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/researcher_formation_plans/1").to route_to("researcher_formation_plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/researcher_formation_plans/1").to route_to("researcher_formation_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/researcher_formation_plans/1").to route_to("researcher_formation_plans#destroy", :id => "1")
    end
  end
end
