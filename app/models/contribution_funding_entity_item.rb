class ContributionFundingEntityItem < ApplicationRecord
  belongs_to :item_category
  belongs_to :contribution
  has_many :contribution_rp_items
end
