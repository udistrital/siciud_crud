class AddGeosToNewAnimalBreeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :new_animal_breeds, :geo_state, foreign_key: true
    add_reference :new_animal_breeds, :geo_country, foreign_key: true
  end
end
