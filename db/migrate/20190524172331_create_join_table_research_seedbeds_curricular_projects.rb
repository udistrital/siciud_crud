class CreateJoinTableResearchSeedbedsCurricularProjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_seedbeds, :curricular_projects do |t|
      # t.index [:research_seedbed_id, :curricular_project_id]
      # t.index [:curricular_project_id, :research_seedbed_id]
    end
  end
end
