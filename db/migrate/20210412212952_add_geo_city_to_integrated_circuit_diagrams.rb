class AddGeoCityToIntegratedCircuitDiagrams < ActiveRecord::Migration[5.2]
  def change
    add_reference :integrated_circuit_diagrams, :geo_city, foreign_key: true
  end
end
