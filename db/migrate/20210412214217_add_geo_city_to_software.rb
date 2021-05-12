class AddGeoCityToSoftware < ActiveRecord::Migration[5.2]
  def change
    add_reference :software, :geo_city, foreign_key: true
  end
end
