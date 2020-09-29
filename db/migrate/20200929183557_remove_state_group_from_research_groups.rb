class RemoveStateGroupFromResearchGroups < ActiveRecord::Migration[5.2]
  def change
    remove_index :research_groups, :state_group_id
    remove_column :research_groups, :state_group_id
  end
end
