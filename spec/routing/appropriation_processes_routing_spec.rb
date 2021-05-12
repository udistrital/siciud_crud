require "rails_helper"

RSpec.describe AppropriationProcessesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/appropriation_processes").to route_to("appropriation_processes#index")
    end

    it "routes to #show" do
      expect(:get => "/appropriation_processes/1").to route_to("appropriation_processes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/appropriation_processes").to route_to("appropriation_processes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/appropriation_processes/1").to route_to("appropriation_processes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/appropriation_processes/1").to route_to("appropriation_processes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/appropriation_processes/1").to route_to("appropriation_processes#destroy", :id => "1")
    end
  end
end
