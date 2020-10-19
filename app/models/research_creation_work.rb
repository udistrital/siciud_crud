class ResearchCreationWork < ApplicationRecord
  belongs_to :award
  belongs_to :knwl_spec_area
  belongs_to :category
  belongs_to :research_group
end
