class CreateJoinTableSniesResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :snies, :research_networks do |t|
      # t.index [:snies_id, :research_network_id]
      # t.index [:research_network_id, :snies_id]
    end
  end
end
