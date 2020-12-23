require "rails_helper"

RSpec.describe ParticipantTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/participant_types").to route_to("participant_types#index")
    end

    it "routes to #show" do
      expect(:get => "/participant_types/1").to route_to("participant_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/participant_types").to route_to("participant_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/participant_types/1").to route_to("participant_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/participant_types/1").to route_to("participant_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/participant_types/1").to route_to("participant_types#destroy", :id => "1")
    end
  end
end
