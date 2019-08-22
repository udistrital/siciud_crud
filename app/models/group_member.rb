class GroupMember < ApplicationRecord
  include Swagger::GroupMemberSchema

  belongs_to :role
  belongs_to :researcher
  belongs_to :research_group
  belongs_to :state_researcher
  has_many :gm_periods
end
