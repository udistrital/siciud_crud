require "rails_helper"

RSpec.describe PaperTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/paper_types").to route_to("paper_types#index")
    end

    it "routes to #show" do
      expect(:get => "/paper_types/1").to route_to("paper_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/paper_types").to route_to("paper_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/paper_types/1").to route_to("paper_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/paper_types/1").to route_to("paper_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/paper_types/1").to route_to("paper_types#destroy", :id => "1")
    end
  end
end
