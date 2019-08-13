class Contribution < ApplicationRecord
  belongs_to :funding_entity
  belongs_to :agreement
  has_many :contribution_funding_entity_items
  validates :inKindContribution, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :cashContribution, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
end
