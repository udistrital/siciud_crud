class ContributionRpItem < ApplicationRecord
  belongs_to :agreement_research_project
  belongs_to :contribution_funding_entity_item
  has_many :arp_expenses
  validates :cashValue, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :inKindValue, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
end
