class CreateIdiInvestigationProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :idi_investigation_projects do |t|
      t.string :institution
      t.string :contract_number
      t.string :title
      t.integer :year
      t.string :funding_institution
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
    add_index :idi_investigation_projects, :category_id
    add_foreign_key :idi_investigation_projects, :subtypes, column: :category_id, primary_key: :id

    add_index :idi_investigation_projects, :created_by
    add_foreign_key :idi_investigation_projects, :users, column: :created_by, primary_key: :id

    add_index :idi_investigation_projects, :updated_by
    add_foreign_key :idi_investigation_projects, :users, column: :updated_by, primary_key: :id
  end
end
