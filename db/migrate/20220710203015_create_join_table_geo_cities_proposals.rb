class CreateJoinTableGeoCitiesProposals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :geo_cities, :proposals do |t|
      # t.index [:geo_city_id, :proposal_id]
      # t.index [:proposal_id, :geo_city_id]
    end
  end
end
