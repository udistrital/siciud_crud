require 'rails_helper'

RSpec.describe "IntegratedCircuitDiagrams", type: :request do
  describe "GET /integrated_circuit_diagrams" do
    it "works! (now write some real specs)" do
      get integrated_circuit_diagrams_path
      expect(response).to have_http_status(200)
    end
  end
end
