class ResearchCreationWork < ApplicationRecord
  belongs_to :knwl_spec_area
  belongs_to :category
  belongs_to :research_group

  has_many :awards
  has_and_belongs_to_many :work_types

  # Publication place
  belongs_to :geo_city, optional: true
  has_one :geo_state, through: :geo_city
  has_one :geo_country, through: :geo_state

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
