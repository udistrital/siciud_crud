class AddTrackingToUserRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_roles, :active, :boolean, default: true

    add_column :user_roles, :created_by, :bigint
    add_index :user_roles, :created_by
    add_foreign_key :user_roles, :users, column: :created_by, primary_key: :id

    add_column :user_roles, :updated_by, :bigint
    add_index :user_roles, :updated_by
    add_foreign_key :user_roles, :users, column: :updated_by, primary_key: :id

    change_column_default :user_roles, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :user_roles, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
