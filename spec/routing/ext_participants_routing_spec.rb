require "rails_helper"

RSpec.describe ExtParticipantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/ext_participants").to route_to("ext_participants#index")
    end

    it "routes to #show" do
      expect(:get => "/ext_participants/1").to route_to("ext_participants#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ext_participants").to route_to("ext_participants#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ext_participants/1").to route_to("ext_participants#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ext_participants/1").to route_to("ext_participants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ext_participants/1").to route_to("ext_participants#destroy", :id => "1")
    end
  end
end
