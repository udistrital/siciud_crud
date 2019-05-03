class ResearchFocus < ApplicationRecord
  belongs_to :faculty
  has_many :research_groups
  validates :name, presence: true
  has_and_belongs_to_many :research_groups

end
