class MobilityCall < ApplicationRecord
  include Swagger::MobilityCallSchema

  belongs_to :call
  belongs_to :geo_city, optional: true
  belongs_to :geo_country
  belongs_to :geo_state, optional: true
  belongs_to :research_group
  belongs_to :researcher

  has_many :documents, as: :documentable

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
