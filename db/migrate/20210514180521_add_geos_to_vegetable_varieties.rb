class AddGeosToVegetableVarieties < ActiveRecord::Migration[5.2]
  def change
    add_reference :vegetable_varieties, :geo_state, foreign_key: true
    add_reference :vegetable_varieties, :geo_country, foreign_key: true
  end
end
