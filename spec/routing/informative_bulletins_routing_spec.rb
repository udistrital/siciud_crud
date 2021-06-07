require "rails_helper"

RSpec.describe InformativeBulletinsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/informative_bulletins").to route_to("informative_bulletins#index")
    end

    it "routes to #show" do
      expect(:get => "/informative_bulletins/1").to route_to("informative_bulletins#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/informative_bulletins").to route_to("informative_bulletins#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/informative_bulletins/1").to route_to("informative_bulletins#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/informative_bulletins/1").to route_to("informative_bulletins#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/informative_bulletins/1").to route_to("informative_bulletins#destroy", :id => "1")
    end
  end
end
