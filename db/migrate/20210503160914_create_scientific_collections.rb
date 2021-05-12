class CreateScientificCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :scientific_collections do |t|
      t.string :name
      t.date :date_of_obtaining
      t.string :managing_institution_name
      t.string :curator_name
      t.date :last_conservatorship_date
      t.date :validity_and_use
      t.text :information_included
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

    add_index :scientific_collections, :category_id
    add_foreign_key :scientific_collections, :subtypes, column: :category_id, primary_key: :id

    add_index :scientific_collections, :created_by
    add_foreign_key :scientific_collections, :users, column: :created_by, primary_key: :id

    add_index :scientific_collections, :updated_by
    add_foreign_key :scientific_collections, :users, column: :updated_by, primary_key: :id

  end
end
