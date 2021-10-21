class ChangeSniesFromResearchGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :research_groups, :snies_id, :string

    add_reference :research_groups, :snies, foreign_key: true
  end
end
