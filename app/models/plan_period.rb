class PlanPeriod < ApplicationRecord
  has_many :research_project_plans
  has_many :researcher_formation_plans
  has_many :result_transfer_plans
  has_many :social_appropriation_plans
  belongs_to :planable, polymorphic: true
end
