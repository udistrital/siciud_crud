require "rails_helper"

RSpec.describe NewScientificRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/new_scientific_records").to route_to("new_scientific_records#index")
    end

    it "routes to #show" do
      expect(:get => "/new_scientific_records/1").to route_to("new_scientific_records#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/new_scientific_records").to route_to("new_scientific_records#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/new_scientific_records/1").to route_to("new_scientific_records#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/new_scientific_records/1").to route_to("new_scientific_records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/new_scientific_records/1").to route_to("new_scientific_records#destroy", :id => "1")
    end
  end
end
