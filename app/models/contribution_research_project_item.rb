class ContributionResearchProjectItem < ApplicationRecord
  belongs_to :item_category
  belongs_to :contribution
end
