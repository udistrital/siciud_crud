class DropJoinTableUsersUserRoles < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :users, :user_roles do |t|
      # t.index [:user_id, :user_role_id]
      # t.index [:user_role_id, :user_id]
    end
  end
end
