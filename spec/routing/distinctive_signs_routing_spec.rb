require "rails_helper"

RSpec.describe DistinctiveSignsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/distinctive_signs").to route_to("distinctive_signs#index")
    end

    it "routes to #show" do
      expect(:get => "/distinctive_signs/1").to route_to("distinctive_signs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/distinctive_signs").to route_to("distinctive_signs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/distinctive_signs/1").to route_to("distinctive_signs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/distinctive_signs/1").to route_to("distinctive_signs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/distinctive_signs/1").to route_to("distinctive_signs#destroy", :id => "1")
    end
  end
end
