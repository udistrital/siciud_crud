class SmPeriod < ApplicationRecord
  belongs_to :role
  belongs_to :seedbeed_member
  validates :initialDate, presence: true
end
