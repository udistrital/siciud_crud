class CreateRegulations < ActiveRecord::Migration[5.2]
  def change
    create_table :regulations do |t|
      t.string :title
      t.date :date_of_publication
      t.string :issuing_entity
      t.bigint :regulation_type_id
      t.bigint :product_type_id
      t.references :geo_city, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :regulations, :category_id
    add_foreign_key :regulations, :subtypes, column: :category_id, primary_key: :id

    add_index :regulations, :regulation_type_id
    add_foreign_key :regulations, :subtypes, column: :regulation_type_id, primary_key: :id

    add_index :regulations, :product_type_id
    add_foreign_key :regulations, :subtypes, column: :product_type_id, primary_key: :id

    add_index :regulations, :created_by
    add_foreign_key :regulations, :users, column: :created_by, primary_key: :id

    add_index :regulations, :updated_by
    add_foreign_key :regulations, :users, column: :updated_by, primary_key: :id

  end
end
