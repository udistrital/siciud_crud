require "rails_helper"

RSpec.describe PetitionStatusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/petition_statuses").to route_to("petition_statuses#index")
    end

    it "routes to #show" do
      expect(:get => "/petition_statuses/1").to route_to("petition_statuses#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/petition_statuses").to route_to("petition_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/petition_statuses/1").to route_to("petition_statuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/petition_statuses/1").to route_to("petition_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/petition_statuses/1").to route_to("petition_statuses#destroy", :id => "1")
    end
  end
end
