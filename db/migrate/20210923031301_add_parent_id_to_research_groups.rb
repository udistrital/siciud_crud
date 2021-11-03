class AddParentIdToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :parent_id, :bigint
    add_index :research_groups, :parent_id
    add_foreign_key :research_groups, :research_groups, column: :parent_id, primary_key: :id
  end
end
