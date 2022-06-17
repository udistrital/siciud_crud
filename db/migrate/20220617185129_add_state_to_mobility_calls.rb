class AddStateToMobilityCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :mobility_calls, :state_id, :bigint
    add_index :mobility_calls, :state_id
    add_foreign_key :mobility_calls, :subtypes, column: :state_id, primary_key: :id

    add_column :mobility_calls, :total, :decimal, precision: 5, scale: 2
  end
end
