class UpdateCompleteContentGenerationsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_content_generations, version: 2, revert_to_version: 1
  end
end
