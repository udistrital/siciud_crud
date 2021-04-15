class DropTableGroupTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :group_types
  end
end
