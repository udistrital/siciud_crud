class UpdateResearchUnitsToVersion12 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units, version: 12, revert_to_version: 11
  end
end
