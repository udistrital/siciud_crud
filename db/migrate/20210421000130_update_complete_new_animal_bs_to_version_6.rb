class UpdateCompleteNewAnimalBsToVersion6 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_new_animal_bs, version: 6, revert_to_version: 5
  end
end
