class AddTrackingToPetitionStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :petition_statuses, :active, :boolean, default: true

    add_column :petition_statuses, :created_by, :bigint
    add_index :petition_statuses, :created_by
    add_foreign_key :petition_statuses, :users, column: :created_by, primary_key: :id

    add_column :petition_statuses, :updated_by, :bigint
    add_index :petition_statuses, :updated_by
    add_foreign_key :petition_statuses, :users, column: :updated_by, primary_key: :id

    change_column_default :petition_statuses, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :petition_statuses, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
