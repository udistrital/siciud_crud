require "rails_helper"

RSpec.describe IntegratedCircuitDiagramsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/integrated_circuit_diagrams").to route_to("integrated_circuit_diagrams#index")
    end

    it "routes to #show" do
      expect(:get => "/integrated_circuit_diagrams/1").to route_to("integrated_circuit_diagrams#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/integrated_circuit_diagrams").to route_to("integrated_circuit_diagrams#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/integrated_circuit_diagrams/1").to route_to("integrated_circuit_diagrams#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/integrated_circuit_diagrams/1").to route_to("integrated_circuit_diagrams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/integrated_circuit_diagrams/1").to route_to("integrated_circuit_diagrams#destroy", :id => "1")
    end
  end
end
