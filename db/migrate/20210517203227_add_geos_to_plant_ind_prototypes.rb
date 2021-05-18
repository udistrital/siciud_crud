class AddGeosToPlantIndPrototypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :plant_ind_prototypes, :geo_state, foreign_key: true
    add_reference :plant_ind_prototypes, :geo_country, foreign_key: true
  end
end
