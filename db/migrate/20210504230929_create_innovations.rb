class CreateInnovations < ActiveRecord::Migration[5.2]
  def change
    create_table :innovations do |t|
      t.string :name
      t.string :nit
      t.string :company_name
      t.date :date_of_obtaining
      t.bigint :product_type_id
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

    add_index :innovations, :category_id
    add_foreign_key :innovations, :subtypes, column: :category_id, primary_key: :id

    add_index :innovations, :product_type_id
    add_foreign_key :innovations, :subtypes, column: :product_type_id, primary_key: :id

    add_index :innovations, :created_by
    add_foreign_key :innovations, :users, column: :created_by, primary_key: :id

    add_index :innovations, :updated_by
    add_foreign_key :innovations, :users, column: :updated_by, primary_key: :id
    
  end
end
