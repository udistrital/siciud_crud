class CreateNewGeneticSequences < ActiveRecord::Migration[5.2]
  def change
    create_table :new_genetic_sequences do |t|
      t.string :name
      t.date :obtaining_date
      t.string :certifying_institution
      t.string :database_name
      t.string :database_url
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

    add_index :new_genetic_sequences, :category_id
    add_foreign_key :new_genetic_sequences, :subtypes, column: :category_id, primary_key: :id

    add_index :new_genetic_sequences, :created_by
    add_foreign_key :new_genetic_sequences, :users, column: :created_by, primary_key: :id

    add_index :new_genetic_sequences, :updated_by
    add_foreign_key :new_genetic_sequences, :users, column: :updated_by, primary_key: :id
    
  end
end
