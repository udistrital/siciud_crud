class RemoveTimestampsFromGeoCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :geo_cities, :created_at, :datetime
    remove_column :geo_cities, :updated_at, :datetime
  end
end
