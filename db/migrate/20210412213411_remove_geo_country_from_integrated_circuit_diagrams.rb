class RemoveGeoCountryFromIntegratedCircuitDiagrams < ActiveRecord::Migration[5.2]
  def change
    remove_reference :integrated_circuit_diagrams, :geo_country, foreign_key: true
  end
end
