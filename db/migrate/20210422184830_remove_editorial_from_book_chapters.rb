class RemoveEditorialFromBookChapters < ActiveRecord::Migration[5.2]
  def change
    remove_reference :book_chapters, :editorial, foreign_key: true
  end
end
