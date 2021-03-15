class AddCategoryFromSubTypesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :category_id, :bigint
    add_index :books, :category_id
    add_foreign_key :books, :subtypes, column: :category_id, primary_key: :id
  end
end
