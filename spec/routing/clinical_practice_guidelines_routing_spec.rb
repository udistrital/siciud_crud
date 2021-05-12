require "rails_helper"

RSpec.describe ClinicalPracticeGuidelinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/clinical_practice_guidelines").to route_to("clinical_practice_guidelines#index")
    end

    it "routes to #show" do
      expect(:get => "/clinical_practice_guidelines/1").to route_to("clinical_practice_guidelines#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/clinical_practice_guidelines").to route_to("clinical_practice_guidelines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clinical_practice_guidelines/1").to route_to("clinical_practice_guidelines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clinical_practice_guidelines/1").to route_to("clinical_practice_guidelines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clinical_practice_guidelines/1").to route_to("clinical_practice_guidelines#destroy", :id => "1")
    end
  end
end
