class AddEditorialNameToBookChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :book_chapters, :editorial_name, :string
  end
end
