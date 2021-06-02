class CreateMagazineEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :magazine_editions do |t|
      t.string :title
      t.string :editorial_name
      t.string :issn
      t.integer :publication_year
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.date :editorial_date
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :magazine_editions, :category_id
    add_foreign_key :magazine_editions, :subtypes, column: :category_id, primary_key: :id

    add_index :magazine_editions, :created_by
    add_foreign_key :magazine_editions, :users, column: :created_by, primary_key: :id

    add_index :magazine_editions, :updated_by
    add_foreign_key :magazine_editions, :users, column: :updated_by, primary_key: :id
  end
end
