class CreateIndicators < ActiveRecord::Migration[5.2]
  def change
    create_table :indicators do |t|
      t.bigint :product_type_id
      t.text :ind_description
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :indicators, :product_type_id
    add_foreign_key :indicators, :subtypes, column: :product_type_id, primary_key: :id

    add_index :indicators, :created_by
    add_foreign_key :indicators, :users, column: :created_by, primary_key: :id

    add_index :indicators, :updated_by
    add_foreign_key :indicators, :users, column: :updated_by, primary_key: :id
  end
end
