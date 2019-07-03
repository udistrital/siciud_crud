require "rails_helper"

RSpec.describe ResultTransferPlansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/result_transfer_plans").to route_to("result_transfer_plans#index")
    end

    it "routes to #show" do
      expect(:get => "/result_transfer_plans/1").to route_to("result_transfer_plans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/result_transfer_plans").to route_to("result_transfer_plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/result_transfer_plans/1").to route_to("result_transfer_plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/result_transfer_plans/1").to route_to("result_transfer_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/result_transfer_plans/1").to route_to("result_transfer_plans#destroy", :id => "1")
    end
  end
end
