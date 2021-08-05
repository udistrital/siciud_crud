require "rails_helper"

RSpec.describe ProfessionalRolesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/professional_roles").to route_to("professional_roles#index")
    end

    it "routes to #show" do
      expect(:get => "/professional_roles/1").to route_to("professional_roles#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/professional_roles").to route_to("professional_roles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/professional_roles/1").to route_to("professional_roles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/professional_roles/1").to route_to("professional_roles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/professional_roles/1").to route_to("professional_roles#destroy", :id => "1")
    end
  end
end
