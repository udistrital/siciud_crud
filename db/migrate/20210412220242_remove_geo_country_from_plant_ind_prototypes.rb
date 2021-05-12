class RemoveGeoCountryFromPlantIndPrototypes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :plant_ind_prototypes, :geo_country, foreign_key: true
    remove_reference :plant_ind_prototypes, :institution, foreign_key: true
  end
end
