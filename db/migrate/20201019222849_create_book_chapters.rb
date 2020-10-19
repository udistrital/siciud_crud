class CreateBookChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :book_chapters do |t|
      t.string :book_title
      t.string :title
      t.date :publication_date
      t.string :isbn
      t.string :doi
      t.string :url
      t.text :observation
      t.references :category, foreign_key: true
      t.references :editorial, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
