class AddGeoStateToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :geo_state, foreign_key: true
  end
end
