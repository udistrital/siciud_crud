class UpdateCompleteNewAnimalBsToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_new_animal_bs, version: 3, revert_to_version: 2
  end
end
