class AddGeosToBookChapters < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_chapters, :geo_state, foreign_key: true
    add_reference :book_chapters, :geo_country, foreign_key: true
  end
end
