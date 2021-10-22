class CreateJoinTablePotencialMarketGeoCountry < ActiveRecord::Migration[5.2]
  def change
    create_join_table :potential_markets, :geo_countries do |t|
      # t.index [:potential_market_id, :geo_country_id]
      # t.index [:geo_country_id, :potential_market_id]
    end
  end
end
