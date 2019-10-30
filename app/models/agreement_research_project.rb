class AgreementResearchProject < ApplicationRecord
  belongs_to :agreement
  has_many :contribution_rp_items
  has_many :arp_members
  has_one :arp_general_goal
  has_many :arp_activities

end
