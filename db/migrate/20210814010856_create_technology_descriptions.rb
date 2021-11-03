class CreateTechnologyDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :technology_descriptions do |t|
      t.string :denomination
      t.text :product_or_process_features
      t.string :artistic_representation
      t.string :key_words
      t.references :procedure_request, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :technology_descriptions, :created_by
    add_foreign_key :technology_descriptions, :users, column: :created_by, primary_key: :id

    add_index :technology_descriptions, :updated_by
    add_foreign_key :technology_descriptions, :users, column: :updated_by, primary_key: :id
  end
end
