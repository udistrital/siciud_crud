class CreateJoinTablePotencialMarketSubType < ActiveRecord::Migration[5.2]
  def change
    create_join_table :potential_markets, :subtypes, table_name: :potential_markets_segments do |t|
      # t.index [:potential_market_id, :subtype_id]
      # t.index [:subtype_id, :potential_market_id]
    end
  end
end
