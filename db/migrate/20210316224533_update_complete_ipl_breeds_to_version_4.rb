class UpdateCompleteIplBreedsToVersion4 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_ipl_breeds, version: 4, revert_to_version: 3
  end
end
