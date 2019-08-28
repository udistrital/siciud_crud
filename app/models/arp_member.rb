class ArpMember < ApplicationRecord
  belongs_to :arp_role
  belongs_to :agreement
  belongs_to :group_member
end
