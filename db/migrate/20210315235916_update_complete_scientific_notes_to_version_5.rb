class UpdateCompleteScientificNotesToVersion5 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_scientific_notes, version: 5, revert_to_version: 4
  end
end
