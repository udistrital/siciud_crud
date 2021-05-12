class RemoveBookDocumentFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :book_document, :string
  end
end
