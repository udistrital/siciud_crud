class ApSpecificGoal < ApplicationRecord
  belongs_to :ap_general_goal
  has_many :ap_activities
end
