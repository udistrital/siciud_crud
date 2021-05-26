class CreateConsultancies < ActiveRecord::Migration[5.2]
  def change
    create_table :consultancies do |t|
      t.string :title
      t.string :contract_number
      t.text :consulting_objective
      t.date :consultation_date
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

    add_index :consultancies, :category_id
    add_foreign_key :consultancies, :subtypes, column: :category_id, primary_key: :id

    add_index :consultancies, :product_type_id
    add_foreign_key :consultancies, :subtypes, column: :product_type_id, primary_key: :id

    add_index :consultancies, :created_by
    add_foreign_key :consultancies, :users, column: :created_by, primary_key: :id

    add_index :consultancies, :updated_by
    add_foreign_key :consultancies, :users, column: :updated_by, primary_key: :id

  end
end
