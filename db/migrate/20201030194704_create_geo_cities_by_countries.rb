class CreateGeoCitiesByCountries < ActiveRecord::Migration[5.2]
  def change
    create_view :geo_cities_by_countries
  end
end
