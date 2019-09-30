class ArpActivity < ApplicationRecord
  include Swagger::ArpActivitySchema
  belongs_to :arp_specific_goal
  has_one_attached :supportDocument
  has_many :arp_activity_reports
end
