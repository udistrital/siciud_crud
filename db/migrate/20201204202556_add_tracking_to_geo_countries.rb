class AddTrackingToGeoCountries < ActiveRecord::Migration[5.2]
  def change
    change_table :geo_countries do |t|
      t.timestamps
    end
    add_column :geo_countries, :active, :boolean, default: true

    add_column :geo_countries, :created_by, :bigint
    add_index :geo_countries, :created_by
    add_foreign_key :geo_countries, :users, column: :created_by, primary_key: :id

    add_column :geo_countries, :updated_by, :bigint
    add_index :geo_countries, :updated_by
    add_foreign_key :geo_countries, :users, column: :updated_by, primary_key: :id
  end
end
