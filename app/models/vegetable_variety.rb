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

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
end
