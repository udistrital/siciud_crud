class AddCategoryFromSubTypesToBookChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :book_chapters, :category_id, :bigint
    add_index :book_chapters, :category_id
    add_foreign_key :book_chapters, :subtypes, column: :category_id, primary_key: :id
  end
end
