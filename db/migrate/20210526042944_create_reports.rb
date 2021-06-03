class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :project_name
      t.date :date_of_elaboration
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.bigint :product_type_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :reports, :category_id
    add_foreign_key :reports, :subtypes, column: :category_id, primary_key: :id

    add_index :reports, :product_type_id
    add_foreign_key :reports, :subtypes, column: :product_type_id, primary_key: :id

    add_index :reports, :created_by
    add_foreign_key :reports, :users, column: :created_by, primary_key: :id

    add_index :reports, :updated_by
    add_foreign_key :reports, :users, column: :updated_by, primary_key: :id
    
  end
end
