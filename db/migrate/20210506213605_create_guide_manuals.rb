class CreateGuideManuals < ActiveRecord::Migration[5.2]
  def change
    create_table :guide_manuals do |t|
      t.string :title
      t.date :date_of_publication
      t.string :url
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

    add_index :guide_manuals, :category_id
    add_foreign_key :guide_manuals, :subtypes, column: :category_id, primary_key: :id

    add_index :guide_manuals, :product_type_id
    add_foreign_key :guide_manuals, :subtypes, column: :product_type_id, primary_key: :id

    add_index :guide_manuals, :created_by
    add_foreign_key :guide_manuals, :users, column: :created_by, primary_key: :id

    add_index :guide_manuals, :updated_by
    add_foreign_key :guide_manuals, :users, column: :updated_by, primary_key: :id

  end
end
