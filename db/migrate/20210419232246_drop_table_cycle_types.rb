class DropTableCycleTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :cycle_types
  end
end
