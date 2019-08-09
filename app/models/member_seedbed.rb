class MemberSeedbed < ApplicationRecord
  belongs_to :role
  belongs_to :researcher
  belongs_to :research_seedbed
  belongs_to :state_researcher
  belongs_to :researcher_type
  validates :initialDate, presence: true
end
