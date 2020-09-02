class RemoveCurricularProjectFromResearcher < ActiveRecord::Migration[5.2]
  def change
    remove_index :researchers, :curricular_project_id
    remove_column :researchers, :curricular_project_id

    # remove_foreign_key :researchers, column: :curricular_project_id
    # remove_reference :researchers, :curricular_project, foreign_key: true
  end
end
