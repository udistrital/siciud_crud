class UpdateResearchUnitsToVersion16 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units, version: 16, revert_to_version: 15
  end
end
