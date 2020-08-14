class CineDetailedArea < ApplicationRecord
  belongs_to :cine_specific_area
  has_and_belongs_to_many :research_groups
end
