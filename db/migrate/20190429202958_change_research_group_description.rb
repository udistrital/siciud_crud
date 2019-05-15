class ChangeResearchGroupDescription < ActiveRecord::Migration[5.2]
  def change
      rename_column :research_groups, :descripion, :description
  end
end
