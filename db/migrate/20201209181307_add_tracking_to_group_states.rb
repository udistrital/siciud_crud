class AddTrackingToGroupStates < ActiveRecord::Migration[5.2]
  def change
    add_column :group_states, :active, :boolean, default: true

    add_column :group_states, :created_by, :bigint
    add_index :group_states, :created_by
    add_foreign_key :group_states, :users, column: :created_by, primary_key: :id

    add_column :group_states, :updated_by, :bigint
    add_index :group_states, :updated_by
    add_foreign_key :group_states, :users, column: :updated_by, primary_key: :id

    change_column_default :group_states, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :group_states, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
