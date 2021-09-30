class CreateJoinTableResearchFocusesNetworks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subtypes, :research_networks, table_name: :research_focuses_networks do |t|
      # t.index [:subtype_id, :research_network_id]
      # t.index [:research_network_id, :subtype_id]
    end
  end
end
