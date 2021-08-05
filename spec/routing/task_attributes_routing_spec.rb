require "rails_helper"

RSpec.describe TaskAttributesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/task_attributes").to route_to("task_attributes#index")
    end

    it "routes to #show" do
      expect(:get => "/task_attributes/1").to route_to("task_attributes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/task_attributes").to route_to("task_attributes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/task_attributes/1").to route_to("task_attributes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/task_attributes/1").to route_to("task_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_attributes/1").to route_to("task_attributes#destroy", :id => "1")
    end
  end
end
