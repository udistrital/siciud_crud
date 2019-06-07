class PlanPeriod < ApplicationRecord
  belongs_to :research_group
  has_many :research_proyect_plans
  has_many :researcher_formation_plans
  has_many :result_transfer_plans
  has_many :social_appropriation_plans
end
