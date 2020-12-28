class AddTrackingToHistoricalColcienciasRanks < ActiveRecord::Migration[5.2]
  def change
    add_column :historical_colciencias_ranks, :active, :boolean, default: true

    add_column :historical_colciencias_ranks, :created_by, :bigint
    add_index :historical_colciencias_ranks, :created_by
    add_foreign_key :historical_colciencias_ranks, :users, column: :created_by, primary_key: :id

    add_column :historical_colciencias_ranks, :updated_by, :bigint
    add_index :historical_colciencias_ranks, :updated_by
    add_foreign_key :historical_colciencias_ranks, :users, column: :updated_by, primary_key: :id

    change_column_default :historical_colciencias_ranks, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :historical_colciencias_ranks, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
