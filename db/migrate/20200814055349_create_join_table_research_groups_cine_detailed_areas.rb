class CreateJoinTableResearchGroupsCineDetailedAreas < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_groups, :cine_detailed_areas do |t|
      # t.index [:research_group_id, :cine_detailed_area_id]
      # t.index [:cine_detailed_area_id, :research_group_id]
    end
  end
end
