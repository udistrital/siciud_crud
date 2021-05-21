class RemoveBookChapterDocumentFromBookChapters < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_chapters, :book_chapter_document, :string
  end
end
