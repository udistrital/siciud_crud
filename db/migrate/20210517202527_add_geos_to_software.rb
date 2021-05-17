class AddGeosToSoftware < ActiveRecord::Migration[5.2]
  def change
    add_reference :software, :geo_state, foreign_key: true
    add_reference :software, :geo_country, foreign_key: true
  end
end
