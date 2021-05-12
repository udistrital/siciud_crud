class UpdateCompleteIplBreedsToVersion5 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_ipl_breeds, version: 5, revert_to_version: 4
  end
end
