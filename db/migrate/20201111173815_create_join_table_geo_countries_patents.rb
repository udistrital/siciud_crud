class CreateJoinTableGeoCountriesPatents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :geo_countries, :patents do |t|
      # t.index [:geo_country_id, :patent_id]
      # t.index [:patent_id, :geo_country_id]
    end
  end
end
