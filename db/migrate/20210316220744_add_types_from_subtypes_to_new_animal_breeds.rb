class AddTypesFromSubtypesToNewAnimalBreeds < ActiveRecord::Migration[5.2]
  def change
    add_column :new_animal_breeds, :category_id, :bigint
    add_index :new_animal_breeds, :category_id
    add_foreign_key :new_animal_breeds, :subtypes, column: :category_id, primary_key: :id

    add_reference :new_animal_breeds, :colciencias_call, foreign_key: true

    add_column :new_animal_breeds, :cycle_type_id, :bigint
    add_index :new_animal_breeds, :cycle_type_id
    add_foreign_key :new_animal_breeds, :subtypes, column: :cycle_type_id, primary_key: :id

    add_column :new_animal_breeds, :petition_status_id, :bigint
    add_index :new_animal_breeds, :petition_status_id
    add_foreign_key :new_animal_breeds, :subtypes, column: :petition_status_id, primary_key: :id
  end
end
