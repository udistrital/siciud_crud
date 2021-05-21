class AddGeoCityToNewScientificRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :new_scientific_records, :geo_city, foreign_key: true
  end
end
