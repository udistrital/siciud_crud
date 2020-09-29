class AddGmStateToGroupMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :group_members, :gm_state, foreign_key: true
  end
end
