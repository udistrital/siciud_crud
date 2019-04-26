class Period < ApplicationRecord
  belongs_to :role
  belongs_to :researcher

  validates :initialDate, presence: true
end
