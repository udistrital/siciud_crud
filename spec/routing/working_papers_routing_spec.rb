require "rails_helper"

RSpec.describe WorkingPapersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/working_papers").to route_to("working_papers#index")
    end

    it "routes to #show" do
      expect(:get => "/working_papers/1").to route_to("working_papers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/working_papers").to route_to("working_papers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/working_papers/1").to route_to("working_papers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/working_papers/1").to route_to("working_papers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/working_papers/1").to route_to("working_papers#destroy", :id => "1")
    end
  end
end
