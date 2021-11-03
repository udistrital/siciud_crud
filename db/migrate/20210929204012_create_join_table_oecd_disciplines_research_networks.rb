class CreateJoinTableOecdDisciplinesResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :oecd_disciplines, :research_networks do |t|
      # t.index [:oecd_discipline_id, :research_network_id]
      # t.index [:research_network_id, :oecd_discipline_id]
    end
  end
end
