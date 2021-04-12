class UpdateCompleteNewScientificRecordsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_new_scientific_records, version: 2, revert_to_version: 1
  end
end
