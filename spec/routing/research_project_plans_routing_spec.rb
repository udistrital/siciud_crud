require "rails_helper"

RSpec.describe ResearchProjectPlansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/research_project_plans").to route_to("research_project_plans#index")
    end

    it "routes to #show" do
      expect(:get => "/research_project_plans/1").to route_to("research_project_plans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/research_project_plans").to route_to("research_project_plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/research_project_plans/1").to route_to("research_project_plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/research_project_plans/1").to route_to("research_project_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/research_project_plans/1").to route_to("research_project_plans#destroy", :id => "1")
    end
  end
end
