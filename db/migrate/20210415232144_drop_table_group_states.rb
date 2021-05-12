class DropTableGroupStates < ActiveRecord::Migration[5.2]
  def change
    drop_table :group_states
  end
end
