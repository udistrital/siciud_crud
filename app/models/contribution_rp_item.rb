class ContributionRpItem < ApplicationRecord
  belongs_to :agreement_research_project
  belongs_to :contribution_funding_entity_item
  validates :cashValue, :numericality => { :greater_than_or_equal_to => 0 }
  validates :inKindValue, :numericality => { :greater_than_or_equal_to => 0 }
end
