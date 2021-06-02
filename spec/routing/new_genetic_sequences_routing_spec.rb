require "rails_helper"

RSpec.describe NewGeneticSequencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/new_genetic_sequences").to route_to("new_genetic_sequences#index")
    end

    it "routes to #show" do
      expect(:get => "/new_genetic_sequences/1").to route_to("new_genetic_sequences#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/new_genetic_sequences").to route_to("new_genetic_sequences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/new_genetic_sequences/1").to route_to("new_genetic_sequences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/new_genetic_sequences/1").to route_to("new_genetic_sequences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/new_genetic_sequences/1").to route_to("new_genetic_sequences#destroy", :id => "1")
    end
  end
end
