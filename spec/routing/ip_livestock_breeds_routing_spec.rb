require "rails_helper"

RSpec.describe IpLivestockBreedsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/ip_livestock_breeds").to route_to("ip_livestock_breeds#index")
    end

    it "routes to #show" do
      expect(:get => "/ip_livestock_breeds/1").to route_to("ip_livestock_breeds#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ip_livestock_breeds").to route_to("ip_livestock_breeds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ip_livestock_breeds/1").to route_to("ip_livestock_breeds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ip_livestock_breeds/1").to route_to("ip_livestock_breeds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ip_livestock_breeds/1").to route_to("ip_livestock_breeds#destroy", :id => "1")
    end
  end
end
