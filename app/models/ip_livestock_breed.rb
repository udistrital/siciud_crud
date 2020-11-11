class IpLivestockBreed < ApplicationRecord
  # Improved populations of livestock breeds model.
  belongs_to :category
  belongs_to :research_group

  # Publication place
  belongs_to :geo_city
  has_one :geo_state, through: :geo_city
  has_one :geo_country, through: :geo_state

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible

  # Documents
  has_one_attached :certificate_ma_document
  has_one_attached :ip_livestock_breed_document
end
