class ContributionFundingEntityItem < ApplicationRecord
  belongs_to :item_category
  belongs_to :contribution
  has_many :contribution_rp_items
  validates :cashValue, :numericality => { :greater_than_or_equal_to => 0 }
end
