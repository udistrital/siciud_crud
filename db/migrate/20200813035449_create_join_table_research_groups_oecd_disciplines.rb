class CreateJoinTableResearchGroupsOecdDisciplines < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_groups, :oecd_disciplines do |t|
      # t.index [:research_group_id, :oecd_discipline_id]
      # t.index [:oecd_discipline_id, :research_group_id]
    end
  end
end
