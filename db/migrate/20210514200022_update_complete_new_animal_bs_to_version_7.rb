class UpdateCompleteNewAnimalBsToVersion7 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_new_animal_bs, version: 7, revert_to_version: 6
  end
end