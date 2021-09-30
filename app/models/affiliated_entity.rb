class AffiliatedEntity < ApplicationRecord
  include Swagger::AffiliatedEntitySchema

  belongs_to :research_network
  belongs_to :entity
  belongs_to :geo_country
  belongs_to :institution_type, class_name: 'Subtype', foreign_key: 'institution_type_id'

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
