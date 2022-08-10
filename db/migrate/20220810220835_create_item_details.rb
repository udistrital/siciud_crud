class CreateItemDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :item_details do |t|
      t.references :proposal_budget, foreign_key: true
      t.text :description
      t.text :justification
      t.date :estimated_date
      t.bigint :quantity
      t.float :individual_cost
      t.float :subtotal
      t.references :proposal, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :item_details, :created_by
    add_foreign_key :item_details, :users, column: :created_by, primary_key: :id

    add_index :item_details, :updated_by
    add_foreign_key :item_details, :users, column: :updated_by, primary_key: :id
  end
end
