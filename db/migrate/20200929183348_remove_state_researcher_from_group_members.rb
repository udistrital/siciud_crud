class RemoveStateResearcherFromGroupMembers < ActiveRecord::Migration[5.2]
  def change
    remove_index :group_members, :state_researcher_id
    remove_column :group_members, :state_researcher_id
  end
end
