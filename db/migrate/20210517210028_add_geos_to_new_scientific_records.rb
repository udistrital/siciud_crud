class AddGeosToNewScientificRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :new_scientific_records, :geo_state, foreign_key: true
    add_reference :new_scientific_records, :geo_country, foreign_key: true
  end
end
