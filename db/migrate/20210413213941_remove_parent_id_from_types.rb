class RemoveParentIdFromTypes < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :types, :types
    remove_index :types, :t_parent_id
    remove_column :types, :t_parent_id, :bigint
  end
end
