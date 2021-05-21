class RemoveGeoCountryFromIndustrialDesigns < ActiveRecord::Migration[5.2]
  def change
    remove_reference :industrial_designs, :geo_country, foreign_key: true
  end
end
