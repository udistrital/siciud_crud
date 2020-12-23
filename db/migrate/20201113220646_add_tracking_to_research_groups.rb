class AddTrackingToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :created_by, :bigint
    add_column :research_groups, :updated_by, :bigint
  end
end
