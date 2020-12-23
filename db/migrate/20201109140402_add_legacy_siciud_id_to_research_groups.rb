class AddLegacySiciudIdToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :legacy_siciud_id, :integer
  end
end
