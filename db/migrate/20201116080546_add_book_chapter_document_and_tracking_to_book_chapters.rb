class AddBookChapterDocumentAndTrackingToBookChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :book_chapters, :book_chapter_document, :string
    add_column :book_chapters, :active, :boolean, default: true
    add_column :book_chapters, :created_by, :bigint
    add_column :book_chapters, :updated_by, :bigint
  end
end
