class UpdateResearchUnitsToVersion14 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units, version: 14, revert_to_version: 13
  end
end
