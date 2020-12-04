class AddTrackingToGeoCities < ActiveRecord::Migration[5.2]
  def change
    change_table :geo_cities do |t|
      t.timestamps
    end
    add_column :geo_cities, :active, :boolean, default: true

    add_column :geo_cities, :created_by, :bigint
    add_index :geo_cities, :created_by
    add_foreign_key :geo_cities, :users, column: :created_by, primary_key: :id

    add_column :geo_cities, :updated_by, :bigint
    add_index :geo_cities, :updated_by
    add_foreign_key :geo_cities, :users, column: :updated_by, primary_key: :id
  end
end
