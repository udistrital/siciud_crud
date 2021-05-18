class AddGeosToIndustrialDesigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :industrial_designs, :geo_state, foreign_key: true
    add_reference :industrial_designs, :geo_country, foreign_key: true
  end
end
