class AddTypesFromSubtypeToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :group_state_id, :bigint
    add_index :research_groups, :group_state_id
    add_foreign_key :research_groups, :subtypes, column: :group_state_id, primary_key: :id

    add_column :research_groups, :group_type_id, :bigint
    add_index :research_groups, :group_type_id
    add_foreign_key :research_groups, :subtypes, column: :group_type_id, primary_key: :id
  end
end
