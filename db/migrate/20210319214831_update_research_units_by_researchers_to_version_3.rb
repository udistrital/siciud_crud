class UpdateResearchUnitsByResearchersToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units_by_researchers, version: 3, revert_to_version: 2
  end
end
