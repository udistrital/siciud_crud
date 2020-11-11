class Patent < ApplicationRecord
  belongs_to :category
  belongs_to :patent_state
  belongs_to :research_group

  # Countries of obtaining
  has_and_belongs_to_many :geo_countries

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible
end
