class CreateGeoCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :geo_countries do |t|
      t.string :name
      t.string :iso2, limit: 255
      t.string :iso2, limit: 2
      t.string :iso3, limit: 3
      t.string :capital_name, limit: 255
      t.string :currency, limit: 10

      t.timestamps
    end
  end
end
