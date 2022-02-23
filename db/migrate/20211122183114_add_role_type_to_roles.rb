class AddRoleTypeToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :role_type_id, :bigint
    add_index :roles, :role_type_id
    add_foreign_key :roles, :subtypes, column: :role_type_id, primary_key: :id
  end
end
