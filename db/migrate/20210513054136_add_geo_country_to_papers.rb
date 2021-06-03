class AddGeoCountryToPapers < ActiveRecord::Migration[5.2]
  def change
    add_reference :papers, :geo_country, foreign_key: true
  end
end
