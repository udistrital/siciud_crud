class RemoveFieldsFromGroupMember < ActiveRecord::Migration[5.2]
  def change
    remove_reference :group_members, :state_reseacher, foreign_key: true
  end
end
