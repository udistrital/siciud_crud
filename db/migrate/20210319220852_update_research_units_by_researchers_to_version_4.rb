class UpdateResearchUnitsByResearchersToVersion4 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units_by_researchers, version: 4, revert_to_version: 3
  end
end
