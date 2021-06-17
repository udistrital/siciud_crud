class CreateContentGenerations < ActiveRecord::Migration[5.2]
  def change
    create_table :content_generations do |t|
      t.string :magazine_name
      t.string :isbn
      t.string :title
      t.date :generation_date
      t.string :doi
      t.string :bibliographic_reference
      t.string :web_page
      t.integer :volume
      t.integer :pages_number
      t.integer :start_page
      t.integer :final_page
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
    add_index :content_generations, :product_type_id
    add_foreign_key :content_generations, :subtypes, column: :product_type_id, primary_key: :id

    add_index :content_generations, :category_id
    add_foreign_key :content_generations, :subtypes, column: :category_id, primary_key: :id

    add_index :content_generations, :created_by
    add_foreign_key :content_generations, :users, column: :created_by, primary_key: :id

    add_index :content_generations, :updated_by
    add_foreign_key :content_generations, :users, column: :updated_by, primary_key: :id
  end
end
