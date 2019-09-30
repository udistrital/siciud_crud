class ArpActivityReport < ApplicationRecord
  belongs_to :arp_activities
  has_one_attached :supportDocument

end
