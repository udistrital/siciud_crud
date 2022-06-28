class MobilityCall < ApplicationRecord
  include Swagger::MobilityCallSchema

  belongs_to :call
  belongs_to :geo_city, optional: true
  belongs_to :geo_country
  belongs_to :geo_state, optional: true
  belongs_to :research_group
  belongs_to :researcher
  belongs_to :state, class_name: 'Subtype', foreign_key: 'state_id', optional: true

  has_many :documents, as: :documentable
  has_many :mobility_call_criteria

  validates :total, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100 }, allow_nil: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
