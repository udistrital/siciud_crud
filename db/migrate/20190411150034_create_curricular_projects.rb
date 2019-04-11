class CreateCurricularProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :curricular_projects do |t|
      t.string :name
      t.references :faculty, foreign_key: true

      t.timestamps
    end
  end
end
