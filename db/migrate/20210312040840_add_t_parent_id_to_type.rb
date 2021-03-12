class AddTParentIdToType < ActiveRecord::Migration[5.2]
  def change
    add_column :types, :t_parent_id, :bigint
    add_index :types, :t_parent_id
    add_foreign_key :types, :types, column: :t_parent_id, primary_key: :id
  end
end
