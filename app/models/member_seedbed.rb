class MemberSeedbed < ApplicationRecord
  belongs_to :role
  belongs_to :researcher
  belongs_to :research_seedbed
  belongs_to :state_reseacher
  belongs_to :researcher_type
end
