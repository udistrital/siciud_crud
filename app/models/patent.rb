class Patent < ApplicationRecord
  belongs_to :category
  belongs_to :patent_state
  belongs_to :research_group

  # Countries of obtaining
  has_and_belongs_to_many :geo_countries

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
