class AddGeoCityToIndustrialDesigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :industrial_designs, :geo_city, foreign_key: true
  end
end
