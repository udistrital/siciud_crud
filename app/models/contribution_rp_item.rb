class ContributionRpItem < ApplicationRecord
  belongs_to :agreement_research_project
  belongs_to :contribution_funding_entity_item
end
