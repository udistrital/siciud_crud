class UpdateResearchUnitsToVersion15 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units, version: 15, revert_to_version: 14
  end
end
