class AddParentToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :parent_id, :bigint
    add_index :roles, :parent_id
    add_foreign_key :roles, :roles, column: :parent_id, primary_key: :id
  end
end
