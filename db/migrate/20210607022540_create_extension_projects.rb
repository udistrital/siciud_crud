class CreateExtensionProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :extension_projects do |t|
      t.string :institution
      t.string :administrative_act
      t.string :project_name
      t.date :start_date
      t.string :name_ext_project
      t.date :final_date
      t.string :community_name
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :extension_projects, :category_id
    add_foreign_key :extension_projects, :subtypes, column: :category_id, primary_key: :id

    add_index :extension_projects, :created_by
    add_foreign_key :extension_projects, :users, column: :created_by, primary_key: :id

    add_index :extension_projects, :updated_by
    add_foreign_key :extension_projects, :users, column: :updated_by, primary_key: :id
  end
end
