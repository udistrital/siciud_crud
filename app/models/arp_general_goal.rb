class ArpGeneralGoal < ApplicationRecord
  include Swagger::ArpGeneralGoalSchema
  belongs_to :agreement_research_project
  has_many :arp_specific_goals
end
