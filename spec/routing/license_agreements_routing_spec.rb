require "rails_helper"

RSpec.describe LicenseAgreementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/license_agreements").to route_to("license_agreements#index")
    end

    it "routes to #show" do
      expect(:get => "/license_agreements/1").to route_to("license_agreements#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/license_agreements").to route_to("license_agreements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/license_agreements/1").to route_to("license_agreements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/license_agreements/1").to route_to("license_agreements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/license_agreements/1").to route_to("license_agreements#destroy", :id => "1")
    end
  end
end
