class Indicator < ApplicationRecord
  include Swagger::IndicatorSchema

  belongs_to :subtype
  has_many :calls_indicators

  validates :ind_description, presence: true, allow_nil: false
  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
