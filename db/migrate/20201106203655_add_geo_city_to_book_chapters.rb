class AddGeoCityToBookChapters < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_chapters, :geo_city, foreign_key: true
  end
end
