class AgreementResearchProject < ApplicationRecord
  belongs_to :agreement
  has_many :contribution_rp_items
  has_many :arp_members
  has_many :arp_general_goals
  has_many :arp_activities

end
