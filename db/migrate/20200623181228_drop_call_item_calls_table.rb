class DropCallItemCallsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :call_item_calls
  end
end
