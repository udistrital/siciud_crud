class AddInstitutionToPlantIndPrototypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :plant_ind_prototypes, :institution, foreign_key: true
  end
end
