class CineBroadArea < ApplicationRecord
  has_many :cine_specific_areas
  has_many :research_groups
end
