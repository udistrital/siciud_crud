class RemoveTimestampsFromGeoStates < ActiveRecord::Migration[5.2]
  def change
    remove_column :geo_states, :created_at, :datetime
    remove_column :geo_states, :updated_at, :datetime
  end
end
