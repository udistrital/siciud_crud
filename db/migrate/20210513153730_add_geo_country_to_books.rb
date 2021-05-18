class AddGeoCountryToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :geo_country, foreign_key: true
  end
end
