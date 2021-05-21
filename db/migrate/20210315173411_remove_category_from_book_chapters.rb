class RemoveCategoryFromBookChapters < ActiveRecord::Migration[5.2]
  def change
    remove_reference :book_chapters, :category, foreign_key: true
  end
end
