class RemoveTypesAndDocumentsFromNewAnimalBreeds < ActiveRecord::Migration[5.2]
  def change
    remove_reference :new_animal_breeds, :cycle_type, foreign_key: true
    remove_reference :new_animal_breeds, :petition_status, foreign_key: true
    remove_reference :new_animal_breeds, :category, foreign_key: true
    remove_column :new_animal_breeds, :ccb_ica_document, :string
    remove_column :new_animal_breeds, :new_animal_breed_document, :string
  end
end
