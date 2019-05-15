class CreateJoinTableResearchGroupsResearchResearchFocus < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_groups, :research_focuses do |t|
      # t.index [:research_group_id, :research_focus_id]
      # t.index [:research_focus_id, :research_group_id]
    end
  end
end
