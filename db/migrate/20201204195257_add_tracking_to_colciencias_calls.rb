class AddTrackingToColcienciasCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :colciencias_calls, :active, :boolean, default: true

    add_column :colciencias_calls, :created_by, :bigint
    add_index :colciencias_calls, :created_by
    add_foreign_key :colciencias_calls, :users, column: :created_by, primary_key: :id

    add_column :colciencias_calls, :updated_by, :bigint
    add_index :colciencias_calls, :updated_by
    add_foreign_key :colciencias_calls, :users, column: :updated_by, primary_key: :id
  end
end
