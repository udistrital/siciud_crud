class DropItemCallsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :item_calls
  end
end
