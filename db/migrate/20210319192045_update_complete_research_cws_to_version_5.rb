class UpdateCompleteResearchCwsToVersion5 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_research_cws, version: 5, revert_to_version: 4
  end
end
