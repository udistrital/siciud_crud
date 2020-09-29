class DropStateGroups < ActiveRecord::Migration[5.2]
  def change
    drop_table :state_groups
  end
end
