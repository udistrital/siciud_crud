class ApSpecificGoal < ApplicationRecord
  include Swagger::ApSpecificGoalSchema

  validates :weight, :completedPercentage, presence: true

  belongs_to :ap_general_goal
  has_many :ap_activities
end
