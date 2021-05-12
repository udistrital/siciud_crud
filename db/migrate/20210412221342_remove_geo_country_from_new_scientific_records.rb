class RemoveGeoCountryFromNewScientificRecords < ActiveRecord::Migration[5.2]
  def change
    remove_reference :new_scientific_records, :geo_country, foreign_key: true
  end
end
