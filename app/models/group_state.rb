class GroupState < ApplicationRecord
  has_many :research_groups

  validates :name, presence: true
end
