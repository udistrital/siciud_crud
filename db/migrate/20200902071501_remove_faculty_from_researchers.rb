class RemoveFacultyFromResearchers < ActiveRecord::Migration[5.2]
  def change
    remove_index :researchers, :faculty_id
    remove_column :researchers, :faculty_id
    # remove_reference :researchers, :faculty, foreign_key: true
  end
end
