class AddTrackingToGmPeriods < ActiveRecord::Migration[5.2]
  def change
    add_column :gm_periods, :active, :boolean, default: true

    add_column :gm_periods, :created_by, :bigint
    add_index :gm_periods, :created_by
    add_foreign_key :gm_periods, :users, column: :created_by, primary_key: :id

    add_column :gm_periods, :updated_by, :bigint
    add_index :gm_periods, :updated_by
    add_foreign_key :gm_periods, :users, column: :updated_by, primary_key: :id

    change_column_default :gm_periods, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :gm_periods, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
