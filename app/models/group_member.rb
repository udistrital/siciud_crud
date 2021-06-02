class GroupMember < ApplicationRecord
  include Swagger::GroupMemberSchema

  belongs_to :role
  belongs_to :researcher
  belongs_to :research_group
  belongs_to :gm_state
  has_many :gm_periods
  has_many :arp_members
  has_many :agreements, through: :arp_members

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validate :validate_created_by, :validate_updated_by
end
