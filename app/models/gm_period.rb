class GmPeriod < ApplicationRecord
  belongs_to :role
  belongs_to :group_member
  validates :initial_date, presence: true
end
