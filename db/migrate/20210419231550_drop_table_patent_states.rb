class DropTablePatentStates < ActiveRecord::Migration[5.2]
  def change
    drop_table :patent_states
  end
end
