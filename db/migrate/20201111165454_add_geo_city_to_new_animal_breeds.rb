class AddGeoCityToNewAnimalBreeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :new_animal_breeds, :geo_city, foreign_key: true
  end
end
