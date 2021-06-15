require "rails_helper"

RSpec.describe AccompanimentConsultanciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/accompaniment_consultancies").to route_to("accompaniment_consultancies#index")
    end

    it "routes to #show" do
      expect(:get => "/accompaniment_consultancies/1").to route_to("accompaniment_consultancies#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/accompaniment_consultancies").to route_to("accompaniment_consultancies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/accompaniment_consultancies/1").to route_to("accompaniment_consultancies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/accompaniment_consultancies/1").to route_to("accompaniment_consultancies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/accompaniment_consultancies/1").to route_to("accompaniment_consultancies#destroy", :id => "1")
    end
  end
end
