class AddGeosToRegulations < ActiveRecord::Migration[5.2]
  def change
    add_reference :regulations, :geo_state, foreign_key: true
    add_reference :regulations, :geo_country, foreign_key: true
  end
end
