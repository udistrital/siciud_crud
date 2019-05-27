class RemoveResearcherFocusFromResearchSeedbed < ActiveRecord::Migration[5.2]
  def change
    remove_reference :research_seedbeds, :researcher_seedbed, foreign_key: true
  end
end
