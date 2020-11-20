class AddDocumentsAndTrackingToNewAnimalBreeds < ActiveRecord::Migration[5.2]
  def change
    add_column :new_animal_breeds, :ccb_ica_document, :string
    add_column :new_animal_breeds, :new_animal_breed_document, :string
    add_column :new_animal_breeds, :active, :boolean, default: true

    add_column :new_animal_breeds, :created_by, :bigint
    add_index :new_animal_breeds, :created_by
    add_foreign_key :new_animal_breeds, :users, column: :created_by, primary_key: :id

    add_column :new_animal_breeds, :updated_by, :bigint
    add_index :new_animal_breeds, :updated_by
    add_foreign_key :new_animal_breeds, :users, column: :updated_by, primary_key: :id
  end
end
