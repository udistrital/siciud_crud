class ArpActivity < ApplicationRecord
  include Swagger::ArpActivitySchema
  belongs_to :arp_specific_goal
end
