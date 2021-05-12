class CreateNutraceuticalProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :nutraceutical_products do |t|
      t.string :name
      t.date :date_of_obtaining
      t.string :research_project_title
      t.string :consecutive_registration_invima
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

    add_index :nutraceutical_products, :category_id
    add_foreign_key :nutraceutical_products, :subtypes, column: :category_id, primary_key: :id

    add_index :nutraceutical_products, :created_by
    add_foreign_key :nutraceutical_products, :users, column: :created_by, primary_key: :id

    add_index :nutraceutical_products, :updated_by
    add_foreign_key :nutraceutical_products, :users, column: :updated_by, primary_key: :id

  end
end
