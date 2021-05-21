class AddIntitutionNameToPlantIndPrototypes < ActiveRecord::Migration[5.2]
  def change
    add_column :plant_ind_prototypes, :institution_name, :string
  end
end
