class DropCurricularProjects < ActiveRecord::Migration[5.2]
  def change
    drop_table :curricular_projects
  end
end
