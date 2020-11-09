class AddGeoCityToPatents < ActiveRecord::Migration[5.2]
  def change
    add_reference :patents, :geo_city, foreign_key: true
  end
end
