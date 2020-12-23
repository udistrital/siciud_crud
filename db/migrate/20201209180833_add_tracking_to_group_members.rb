class AddTrackingToGroupMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :group_members, :active, :boolean, default: true

    add_column :group_members, :created_by, :bigint
    add_index :group_members, :created_by
    add_foreign_key :group_members, :users, column: :created_by, primary_key: :id

    add_column :group_members, :updated_by, :bigint
    add_index :group_members, :updated_by
    add_foreign_key :group_members, :users, column: :updated_by, primary_key: :id

    change_column_default :group_members, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :group_members, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
