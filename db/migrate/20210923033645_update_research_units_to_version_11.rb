class UpdateResearchUnitsToVersion11 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units, version: 11, revert_to_version: 10
  end
end
