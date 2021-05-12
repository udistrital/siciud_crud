class AddGeoCityToPlantIndPrototypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :plant_ind_prototypes, :geo_city, foreign_key: true
  end
end
