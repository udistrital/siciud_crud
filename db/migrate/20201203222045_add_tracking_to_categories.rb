class AddTrackingToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :active, :boolean, default: true

    add_column :categories, :created_by, :bigint
    add_index :categories, :created_by
    add_foreign_key :categories, :users, column: :created_by, primary_key: :id

    add_column :categories, :updated_by, :bigint
    add_index :categories, :updated_by
    add_foreign_key :categories, :users, column: :updated_by, primary_key: :id
  end
end
