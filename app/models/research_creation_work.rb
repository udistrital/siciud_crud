class ResearchCreationWork < ApplicationRecord
  # Documents
  has_one_attached :certificate_work_document

  belongs_to :knwl_spec_area
  belongs_to :category
  belongs_to :research_group

  has_many :award
end
