require "rails_helper"

RSpec.describe PatentStatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/patent_states").to route_to("patent_states#index")
    end

    it "routes to #show" do
      expect(:get => "/patent_states/1").to route_to("patent_states#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/patent_states").to route_to("patent_states#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/patent_states/1").to route_to("patent_states#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/patent_states/1").to route_to("patent_states#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/patent_states/1").to route_to("patent_states#destroy", :id => "1")
    end
  end
end
