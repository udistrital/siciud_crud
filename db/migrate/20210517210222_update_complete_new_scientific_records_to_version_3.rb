class UpdateCompleteNewScientificRecordsToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_new_scientific_records, version: 3, revert_to_version: 2
  end
end
