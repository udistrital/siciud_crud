class RemoveTimestampsFromGeoCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :geo_countries, :created_at, :datetime
    remove_column :geo_countries, :updated_at, :datetime
  end
end
