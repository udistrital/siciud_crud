class AddGeoStateToPapers < ActiveRecord::Migration[5.2]
  def change
    add_reference :papers, :geo_state, foreign_key: true
  end
end
