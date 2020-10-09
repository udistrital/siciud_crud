class AddInterinstitutionalToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :interinstitutional, :boolean
  end
end
