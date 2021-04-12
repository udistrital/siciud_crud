class RemoveGeoCountryFromSoftware < ActiveRecord::Migration[5.2]
  def change
    remove_reference :software, :geo_country, foreign_key: true
  end
end
