require "rails_helper"

RSpec.describe MagazineEditionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/magazine_editions").to route_to("magazine_editions#index")
    end

    it "routes to #show" do
      expect(:get => "/magazine_editions/1").to route_to("magazine_editions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/magazine_editions").to route_to("magazine_editions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/magazine_editions/1").to route_to("magazine_editions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/magazine_editions/1").to route_to("magazine_editions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/magazine_editions/1").to route_to("magazine_editions#destroy", :id => "1")
    end
  end
end
