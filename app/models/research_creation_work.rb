class ResearchCreationWork < ApplicationRecord
  belongs_to :knwl_spec_area
  belongs_to :category
  belongs_to :research_group

  has_many :awards
  has_and_belongs_to_many :work_types

  # Publication place
  belongs_to :geo_city
  has_one :geo_state, through: :geo_city
  has_one :geo_country, through: :geo_state

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible
end
