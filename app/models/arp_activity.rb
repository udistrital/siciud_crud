class ArpActivity < ApplicationRecord
  include Swagger::ArpActivitySchema
  has_many :arp_act_s_goals
  has_many :arp_specific_goals, through: :arp_act_s_goals
  has_many :arp_activity_reports
  validates :startDate, presence: true
  validates :finishDate, presence: true
  attribute :completedPercentage, :integer, default: 0
  belongs_to :agreement_research_project
end
