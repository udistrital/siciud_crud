class AddTrackingToIntParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :int_participants, :active, :boolean, default: true

    add_column :int_participants, :created_by, :bigint
    add_index :int_participants, :created_by
    add_foreign_key :int_participants, :users, column: :created_by, primary_key: :id

    add_column :int_participants, :updated_by, :bigint
    add_index :int_participants, :updated_by
    add_foreign_key :int_participants, :users, column: :updated_by, primary_key: :id

    change_column_default :int_participants, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :int_participants, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
