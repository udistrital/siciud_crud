class AddTrackingToGeoStates < ActiveRecord::Migration[5.2]
  def change
    change_table :geo_states do |t|
      t.timestamps
    end
    add_column :geo_states, :active, :boolean, default: true

    add_column :geo_states, :created_by, :bigint
    add_index :geo_states, :created_by
    add_foreign_key :geo_states, :users, column: :created_by, primary_key: :id

    add_column :geo_states, :updated_by, :bigint
    add_index :geo_states, :updated_by
    add_foreign_key :geo_states, :users, column: :updated_by, primary_key: :id
  end
end
