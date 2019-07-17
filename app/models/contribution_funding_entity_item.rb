class ContributionFundingEntityItem < ApplicationRecord
  belongs_to :item_category
  belongs_to :contribution
end
