class AddGeosToInnovations < ActiveRecord::Migration[5.2]
  def change
    add_reference :innovations, :geo_state, foreign_key: true
    add_reference :innovations, :geo_country, foreign_key: true
  end
end
