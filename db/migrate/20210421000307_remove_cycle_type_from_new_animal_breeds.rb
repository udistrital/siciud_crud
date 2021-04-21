class RemoveCycleTypeFromNewAnimalBreeds < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :new_animal_breeds, :subtypes
    remove_index :new_animal_breeds, :cycle_type_id
    remove_column :new_animal_breeds, :cycle_type_id, :bigint
  end
end
