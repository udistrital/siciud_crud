require "rails_helper"

RSpec.describe TaskModelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/task_models").to route_to("task_models#index")
    end

    it "routes to #show" do
      expect(:get => "/task_models/1").to route_to("task_models#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/task_models").to route_to("task_models#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/task_models/1").to route_to("task_models#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/task_models/1").to route_to("task_models#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_models/1").to route_to("task_models#destroy", :id => "1")
    end
  end
end
