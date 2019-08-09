class ContributionRpItem < ApplicationRecord
  belongs_to :item_category
  belongs_to :contribution
  belongs_to :agreement_research_project
end
