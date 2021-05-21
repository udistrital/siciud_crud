class CreateCompleteNewScientificRecords < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_new_scientific_records
  end
end
