class AddGeosToProtocolActs < ActiveRecord::Migration[5.2]
  def change
    add_reference :protocol_acts, :geo_state, foreign_key: true
    add_reference :protocol_acts, :geo_country, foreign_key: true
  end
end
