class CreateJoinTableResearchGroupsCurricularProjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_groups, :curricular_projects do |t|
      # t.index [:research_group_id, :curricular_project_id]
      # t.index [:curricular_project_id, :research_group_id]
    end
  end
end
