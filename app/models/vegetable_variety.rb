class VegetableVariety < ApplicationRecord
  belongs_to :cycle_type
  belongs_to :petition_status
  belongs_to :category
  belongs_to :research_group

  # Publication place
  belongs_to :geo_city
  has_one :geo_state, through: :geo_city
  has_one :geo_country, through: :geo_state

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible
end
