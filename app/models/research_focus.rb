class ResearchFocus < ApplicationRecord
  belongs_to :faculty

  validates :name, presence: true
end
