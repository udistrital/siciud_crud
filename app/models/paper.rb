class Paper < ApplicationRecord
  belongs_to :category
  belongs_to :journal
  belongs_to :paper_type
  belongs_to :research_group
  belongs_to :geo_city

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible

  # Documents
  has_one_attached :paper_document
end
