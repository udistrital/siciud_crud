require "rails_helper"

RSpec.describe DegreeWorksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/degree_works").to route_to("degree_works#index")
    end

    it "routes to #show" do
      expect(:get => "/degree_works/1").to route_to("degree_works#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/degree_works").to route_to("degree_works#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/degree_works/1").to route_to("degree_works#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/degree_works/1").to route_to("degree_works#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/degree_works/1").to route_to("degree_works#destroy", :id => "1")
    end
  end
end
