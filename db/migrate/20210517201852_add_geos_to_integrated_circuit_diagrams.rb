class AddGeosToIntegratedCircuitDiagrams < ActiveRecord::Migration[5.2]
  def change
    add_reference :integrated_circuit_diagrams, :geo_state, foreign_key: true
    add_reference :integrated_circuit_diagrams, :geo_country, foreign_key: true
  end
end
