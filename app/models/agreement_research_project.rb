class AgreementResearchProject < ApplicationRecord
  belongs_to :agreement
  has_many :contribution_rp_items
  has_many :arp_members
  has_many :ap_general_goals

end
