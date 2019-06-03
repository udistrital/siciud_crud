require "rails_helper"

RSpec.describe SocialAppropriationPlansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/social_appropriation_plans").to route_to("social_appropriation_plans#index")
    end

    it "routes to #show" do
      expect(:get => "/social_appropriation_plans/1").to route_to("social_appropriation_plans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/social_appropriation_plans").to route_to("social_appropriation_plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/social_appropriation_plans/1").to route_to("social_appropriation_plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/social_appropriation_plans/1").to route_to("social_appropriation_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/social_appropriation_plans/1").to route_to("social_appropriation_plans#destroy", :id => "1")
    end
  end
end
