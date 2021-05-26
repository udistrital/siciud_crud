require "rails_helper"

RSpec.describe ConsultanciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/consultancies").to route_to("consultancies#index")
    end

    it "routes to #show" do
      expect(:get => "/consultancies/1").to route_to("consultancies#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/consultancies").to route_to("consultancies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/consultancies/1").to route_to("consultancies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/consultancies/1").to route_to("consultancies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/consultancies/1").to route_to("consultancies#destroy", :id => "1")
    end
  end
end
