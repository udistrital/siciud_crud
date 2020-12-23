class CreateCompleteNewAnimalBs < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_new_animal_bs
  end
end
