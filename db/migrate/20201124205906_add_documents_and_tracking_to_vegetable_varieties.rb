class AddDocumentsAndTrackingToVegetableVarieties < ActiveRecord::Migration[5.2]
  def change
    add_column :vegetable_varieties, :vegetable_variety_document, :string
    add_column :vegetable_varieties, :active, :boolean, default: true

    add_column :vegetable_varieties, :created_by, :bigint
    add_index :vegetable_varieties, :created_by
    add_foreign_key :vegetable_varieties, :users, column: :created_by, primary_key: :id

    add_column :vegetable_varieties, :updated_by, :bigint
    add_index :vegetable_varieties, :updated_by
    add_foreign_key :vegetable_varieties, :users, column: :updated_by, primary_key: :id
  end
end
