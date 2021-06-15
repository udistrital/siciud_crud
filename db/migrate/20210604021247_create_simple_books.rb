class CreateSimpleBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_books do |t|
      t.string :isbn
      t.string :title
      t.date :publication_date
      t.string :url
      t.string :editorial_name
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
    add_index :simple_books, :product_type_id
    add_foreign_key :simple_books, :subtypes, column: :product_type_id, primary_key: :id

    add_index :simple_books, :category_id
    add_foreign_key :simple_books, :subtypes, column: :category_id, primary_key: :id

    add_index :simple_books, :created_by
    add_foreign_key :simple_books, :users, column: :created_by, primary_key: :id

    add_index :simple_books, :updated_by
    add_foreign_key :simple_books, :users, column: :updated_by, primary_key: :id
  end
end
