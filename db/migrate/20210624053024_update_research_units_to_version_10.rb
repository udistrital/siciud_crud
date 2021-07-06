class UpdateResearchUnitsToVersion10 < ActiveRecord::Migration[5.2]
  def change
    update_view :research_units, version: 10, revert_to_version: 9
  end
end
