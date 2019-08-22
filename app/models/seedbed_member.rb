class SeedbedMember < ApplicationRecord
  include Swagger::SeedbedMemberSchema
  belongs_to :role
  belongs_to :researcher
  belongs_to :research_seedbed
  belongs_to :state_researcher
  has_many :sm_periods
end
