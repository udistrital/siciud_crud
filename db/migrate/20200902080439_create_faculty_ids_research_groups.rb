class CreateFacultyIdsResearchGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :faculty_ids_research_groups do |t|
      t.references :research_group, foreign_key: true
      t.integer :facultyId

      t.timestamps
    end
  end
end
