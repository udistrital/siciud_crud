class AddTrackingToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :active, :boolean, default: true

    add_column :roles, :created_by, :bigint
    add_index :roles, :created_by
    add_foreign_key :roles, :users, column: :created_by, primary_key: :id

    add_column :roles, :updated_by, :bigint
    add_index :roles, :updated_by
    add_foreign_key :roles, :users, column: :updated_by, primary_key: :id

    change_column_default :roles, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :roles, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
