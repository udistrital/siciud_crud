class AddBookTypeToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_type_id, :bigint
    add_index :books, :book_type_id
    add_foreign_key :books, :subtypes, column: :book_type_id, primary_key: :id
  end
end
