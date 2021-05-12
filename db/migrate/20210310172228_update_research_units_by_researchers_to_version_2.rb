class UpdateResearchUnitsByResearchersToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units_by_researchers, version: 2, revert_to_version: 1
  end
end
