class CreateSoftware < ActiveRecord::Migration[5.2]
  def change
    create_table :software do |t|
      t.string :sof_registration_number
      t.string :sof_product_title
      t.date :sof_date_of_obtaining
      t.references :geo_country, foreign_key: true
      t.text :sof_description
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :software, :category_id
    add_foreign_key :software, :subtypes, column: :category_id, primary_key: :id

    add_index :software, :created_by
    add_foreign_key :software, :users, column: :created_by, primary_key: :id

    add_index :software, :updated_by
    add_foreign_key :software, :users, column: :updated_by, primary_key: :id
    
  end
end
