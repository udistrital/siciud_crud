class GroupMember < ApplicationRecord
  include Swagger::GroupMemberSchema

  belongs_to :role
  belongs_to :researcher
  belongs_to :research_group
  belongs_to :gm_state
  has_many :gm_periods
  has_many :arp_members
  has_many :agreements, through: :arp_members
end
