class CreateJoinTableCineDetailedAreasResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cine_detailed_areas, :research_networks do |t|
      # t.index [:cine_detailed_area_id, :research_network_id]
      # t.index [:research_network_id, :cine_detailed_area_id]
    end
  end
end
