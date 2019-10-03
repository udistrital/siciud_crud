class ArpActivity < ApplicationRecord
  include Swagger::ArpActivitySchema
  belongs_to :arp_specific_goal
  has_many :arp_activity_reports
  validates :weight, presence: true
  validates :startDate, presence: true
  validates :finishDate, presence: true
  attribute :completedPercentage, :integer, default: 0

end
