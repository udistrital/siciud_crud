class AddOecdAreaAndSubareaToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :research_groups, :oecd_knowledge_subarea, foreign_key: true
    add_reference :research_groups, :oecd_knowledge_area, foreign_key: true
  end
end
