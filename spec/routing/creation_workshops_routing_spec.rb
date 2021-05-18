require "rails_helper"

RSpec.describe CreationWorkshopsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/creation_workshops").to route_to("creation_workshops#index")
    end

    it "routes to #show" do
      expect(:get => "/creation_workshops/1").to route_to("creation_workshops#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/creation_workshops").to route_to("creation_workshops#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/creation_workshops/1").to route_to("creation_workshops#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/creation_workshops/1").to route_to("creation_workshops#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creation_workshops/1").to route_to("creation_workshops#destroy", :id => "1")
    end
  end
end
