class AddIndexAndFkTrackingToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_index :research_groups, :created_by
    add_foreign_key :research_groups, :users, column: :created_by, primary_key: :id

    add_index :research_groups, :updated_by
    add_foreign_key :research_groups, :users, column: :updated_by, primary_key: :id
  end
end
