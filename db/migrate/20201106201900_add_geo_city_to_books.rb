class AddGeoCityToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :geo_city, foreign_key: true
  end
end
