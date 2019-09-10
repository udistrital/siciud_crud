class ApSpecificGoal < ApplicationRecord
  include Swagger::ApSpecificGoalSchema

  belongs_to :ap_general_goal
  has_many :ap_activities
end
