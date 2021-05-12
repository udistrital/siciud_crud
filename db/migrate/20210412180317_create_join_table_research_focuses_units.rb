class CreateJoinTableResearchFocusesUnits < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subtypes, :research_groups, table_name: :research_focuses_units do |t|
      # t.index [:subtype_id, :research_group_id]
      # t.index [:research_group_id, :subtype_id]
    end
  end
end
