class RemoveFacultyFromResearchFocuses < ActiveRecord::Migration[5.2]
  def change
    remove_index :research_focuses, :faculty_id
    remove_column :research_focuses, :faculty_id
    # remove_reference :research_focuses, :faculty, foreign_key: true
  end
end
