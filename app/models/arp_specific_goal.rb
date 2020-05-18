class ArpSpecificGoal < ApplicationRecord
  include Swagger::ArpSpecificGoalSchema
  belongs_to :arp_general_goal
  #has_many :arp_activities
  has_many :arp_act_s_goals
  has_many :arp_activities, through: :arp_act_s_goals
end
