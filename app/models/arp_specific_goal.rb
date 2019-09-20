class ArpSpecificGoal < ApplicationRecord
  include Swagger::ArpSpecificGoalSchema
  belongs_to :arp_general_goal
  has_many :arp_activities
end
