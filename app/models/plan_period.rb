class PlanPeriod < ApplicationRecord
  belongs_to :research_group
  belongs_to :research_seedbed
end
