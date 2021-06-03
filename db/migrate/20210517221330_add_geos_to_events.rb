class AddGeosToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :geo_state, foreign_key: true
    add_reference :events, :geo_country, foreign_key: true
  end
end
