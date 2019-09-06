class ApGeneralGoal < ApplicationRecord
  include Swagger::ApGeneralGoalSchema
  belongs_to :agreement_research_project
  has_many :ap_specific_goals
end
