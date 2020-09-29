class RenameFieldFromFacultyIdsResearchGroups < ActiveRecord::Migration[5.2]
  def change
    rename_column :faculty_ids_research_groups, :facultyId, :faculty_id
  end
end
