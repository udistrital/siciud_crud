require "rails_helper"

RSpec.describe IntParticipantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/int_participants").to route_to("int_participants#index")
    end

    it "routes to #show" do
      expect(:get => "/int_participants/1").to route_to("int_participants#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/int_participants").to route_to("int_participants#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/int_participants/1").to route_to("int_participants#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/int_participants/1").to route_to("int_participants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/int_participants/1").to route_to("int_participants#destroy", :id => "1")
    end
  end
end
