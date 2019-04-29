class ResearchFocus < ApplicationRecord
  belongs_to :faculty
  has_many :research_groups
  validates :name, presence: true
end
