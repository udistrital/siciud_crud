class DropJoinTableResearchFocusesGroups < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :research_focuses, :research_groups do |t|
      # t.index [:research_focus_id, :research_group_id]
      # t.index [:research_group_id, :research_focus_id]
    end
  end
end
