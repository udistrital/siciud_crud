class CreateCallItems < ActiveRecord::Migration[5.2]
  def change
    create_table :call_items do |t|
      t.references :call, foreign_key: true
      t.bigint :item_id
      t.decimal :ci_maximum_percentage, precision: 6, scale: 3
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :call_items, :item_id
    add_foreign_key :call_items, :subtypes, column: :item_id, primary_key: :id

    add_index :call_items, :created_by
    add_foreign_key :call_items, :users, column: :created_by, primary_key: :id

    add_index :call_items, :updated_by
    add_foreign_key :call_items, :users, column: :updated_by, primary_key: :id
  end
end
