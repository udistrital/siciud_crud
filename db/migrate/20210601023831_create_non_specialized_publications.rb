class CreateNonSpecializedPublications < ActiveRecord::Migration[5.2]
  def change
    create_table :non_specialized_publications do |t|
      t.string :name
      t.string :project_title
      t.date :start_date
      t.date :final_date
      t.string :funding_institution
      t.string :url
      t.string :circulation_route
      t.string :target_audiences
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

    add_index :non_specialized_publications, :category_id
    add_foreign_key :non_specialized_publications, :subtypes, column: :category_id, primary_key: :id

    add_index :non_specialized_publications, :created_by
    add_foreign_key :non_specialized_publications, :users, column: :created_by, primary_key: :id

    add_index :non_specialized_publications, :updated_by
    add_foreign_key :non_specialized_publications, :users, column: :updated_by, primary_key: :id
    
  end
end
