require "rails_helper"

RSpec.describe InvestigationProjectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/investigation_projects").to route_to("investigation_projects#index")
    end

    it "routes to #show" do
      expect(:get => "/investigation_projects/1").to route_to("investigation_projects#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/investigation_projects").to route_to("investigation_projects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/investigation_projects/1").to route_to("investigation_projects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/investigation_projects/1").to route_to("investigation_projects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/investigation_projects/1").to route_to("investigation_projects#destroy", :id => "1")
    end
  end
end
