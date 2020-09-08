class DropJoinTableCurricularProjectsResearchSeedbeds < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :curricular_projects, :research_seedbeds do |t|
      # t.index [:curricular_project_id, :research_seedbed_id]
      # t.index [:research_seedbed_id, :curricular_project_id]
    end
  end
end
