class SmPeriod < ApplicationRecord
  belongs_to :role
  belongs_to :seedbed_member
  validates :initialDate, presence: true
end
