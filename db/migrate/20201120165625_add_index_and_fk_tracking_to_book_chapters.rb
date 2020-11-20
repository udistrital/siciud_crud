class AddIndexAndFkTrackingToBookChapters < ActiveRecord::Migration[5.2]
  def change
    add_index :book_chapters, :created_by
    add_foreign_key :book_chapters, :users, column: :created_by, primary_key: :id

    add_index :book_chapters, :updated_by
    add_foreign_key :book_chapters, :users, column: :updated_by, primary_key: :id
  end
end
