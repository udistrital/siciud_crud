class RenameFieldFromCurricularIdsResearchGroups < ActiveRecord::Migration[5.2]
  def change
    rename_column :curricular_prj_ids_research_groups, :curricular_projectId, :curricular_project_id
  end
end
