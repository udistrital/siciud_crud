class GmState < ApplicationRecord
  has_many :group_members

  validates :name, presence: true
end
