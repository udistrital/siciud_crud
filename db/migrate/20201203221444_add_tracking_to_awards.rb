class AddTrackingToAwards < ActiveRecord::Migration[5.2]
  def change
    add_column :awards, :active, :boolean

    add_column :awards, :created_by, :bigint
    add_index :awards, :created_by
    add_foreign_key :awards, :users, column: :created_by, primary_key: :id

    add_column :awards, :updated_by, :bigint
    add_index :awards, :updated_by
    add_foreign_key :awards, :users, column: :updated_by, primary_key: :id
  end
end
