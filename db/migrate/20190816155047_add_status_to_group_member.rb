class AddStatusToGroupMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :group_members, :state_researcher, foreign_key: true
  end
end
