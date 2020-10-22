class AddCineBroadAreaAndCineSpecificAreaToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :research_groups, :cine_broad_area, foreign_key: true
    add_reference :research_groups, :cine_specific_area, foreign_key: true
  end
end
