require "rails_helper"

RSpec.describe PlanPeriodsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/plan_periods").to route_to("plan_periods#index")
    end

    it "routes to #show" do
      expect(:get => "/plan_periods/1").to route_to("plan_periods#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/plan_periods").to route_to("plan_periods#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/plan_periods/1").to route_to("plan_periods#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plan_periods/1").to route_to("plan_periods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plan_periods/1").to route_to("plan_periods#destroy", :id => "1")
    end
  end
end
