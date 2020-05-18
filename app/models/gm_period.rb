class GmPeriod < ApplicationRecord
  belongs_to :role
  belongs_to :group_member
  validates :initialDate, presence: true
end
