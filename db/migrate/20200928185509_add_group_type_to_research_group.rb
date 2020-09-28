class AddGroupTypeToResearchGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :research_groups, :group_type, foreign_key: true
  end
end
