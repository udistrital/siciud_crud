class AddTrackingToGroupTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :group_types, :active, :boolean, default: true

    add_column :group_types, :created_by, :bigint
    add_index :group_types, :created_by
    add_foreign_key :group_types, :users, column: :created_by, primary_key: :id

    add_column :group_types, :updated_by, :bigint
    add_index :group_types, :updated_by
    add_foreign_key :group_types, :users, column: :updated_by, primary_key: :id

    change_column_default :group_types, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :group_types, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
