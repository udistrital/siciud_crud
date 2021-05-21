class UpdateCompleteNewAnimalBsToVersion5 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_new_animal_bs, version: 5, revert_to_version: 4
  end
end
