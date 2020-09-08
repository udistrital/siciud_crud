class DropJoinTableCurricularProjectsResearchGroups < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :curricular_projects, :research_groups do |t|
      # t.index [:curricular_project_id, :research_group_id]
      # t.index [:research_group_id, :curricular_project_id]
    end
  end
end
