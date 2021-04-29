class CreateTechnicalConcepts < ActiveRecord::Migration[5.2]
  def change
    create_table :technical_concepts do |t|
      t.string :title
      t.date :request_date
      t.bigint :consecutive_number
      t.date :send_date
      t.string :requesting_institution_name
      t.references :geo_city, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true 
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :technical_concepts, :category_id
    add_foreign_key :technical_concepts, :subtypes, column: :category_id, primary_key: :id

    add_index :technical_concepts, :created_by
    add_foreign_key :technical_concepts, :users, column: :created_by, primary_key: :id

    add_index :technical_concepts, :updated_by
    add_foreign_key :technical_concepts, :users, column: :updated_by, primary_key: :id
  end
end
