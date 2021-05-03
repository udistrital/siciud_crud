require "rails_helper"

RSpec.describe EnterpriseSecretsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/enterprise_secrets").to route_to("enterprise_secrets#index")
    end

    it "routes to #show" do
      expect(:get => "/enterprise_secrets/1").to route_to("enterprise_secrets#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/enterprise_secrets").to route_to("enterprise_secrets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/enterprise_secrets/1").to route_to("enterprise_secrets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/enterprise_secrets/1").to route_to("enterprise_secrets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/enterprise_secrets/1").to route_to("enterprise_secrets#destroy", :id => "1")
    end
  end
end
