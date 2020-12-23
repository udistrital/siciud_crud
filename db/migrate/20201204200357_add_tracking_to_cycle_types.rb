class AddTrackingToCycleTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :cycle_types, :active, :boolean, default: true

    add_column :cycle_types, :created_by, :bigint
    add_index :cycle_types, :created_by
    add_foreign_key :cycle_types, :users, column: :created_by, primary_key: :id

    add_column :cycle_types, :updated_by, :bigint
    add_index :cycle_types, :updated_by
    add_foreign_key :cycle_types, :users, column: :updated_by, primary_key: :id
  end
end
