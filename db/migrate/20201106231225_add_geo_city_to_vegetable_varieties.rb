class AddGeoCityToVegetableVarieties < ActiveRecord::Migration[5.2]
  def change
    add_reference :vegetable_varieties, :geo_city, foreign_key: true
  end
end
