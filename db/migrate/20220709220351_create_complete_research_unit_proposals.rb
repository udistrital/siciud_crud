class CreateCompleteResearchUnitProposals < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_research_unit_proposals
  end
end
