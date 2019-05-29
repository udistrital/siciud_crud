class Member < ApplicationRecord
  belongs_to :role
  belongs_to :researcher
  belongs_to :research_group
  belongs_to :state_researcher
  validates :initialDate, presence: true
end
