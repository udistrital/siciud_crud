require "rails_helper"

RSpec.describe NextTasksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/next_tasks").to route_to("next_tasks#index")
    end

    it "routes to #show" do
      expect(:get => "/next_tasks/1").to route_to("next_tasks#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/next_tasks").to route_to("next_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/next_tasks/1").to route_to("next_tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/next_tasks/1").to route_to("next_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/next_tasks/1").to route_to("next_tasks#destroy", :id => "1")
    end
  end
end
