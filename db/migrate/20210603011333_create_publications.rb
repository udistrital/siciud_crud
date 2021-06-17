class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :name
      t.string :project_title
      t.date :start_date
      t.date :final_date
      t.string :funding_institution
      t.string :url
      t.string :circulation_route
      t.string :target_audiences
      t.integer :duration
      t.bigint :duration_type_id
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.bigint :product_type_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default:true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :publications, :duration_type_id
    add_foreign_key :publications, :subtypes, column: :duration_type_id, primary_key: :id

    add_index :publications, :product_type_id
    add_foreign_key :publications, :subtypes, column: :product_type_id, primary_key: :id

    add_index :publications, :category_id
    add_foreign_key :publications, :subtypes, column: :category_id, primary_key: :id

    add_index :publications, :created_by
    add_foreign_key :publications, :users, column: :created_by, primary_key: :id

    add_index :publications, :updated_by
    add_foreign_key :publications, :users, column: :updated_by, primary_key: :id
  end
end
