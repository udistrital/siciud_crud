class Impact < ApplicationRecord
  include Swagger::ImpactSchema

  belongs_to :indicator
  belongs_to :proposal

  belongs_to :impact_type, class_name: 'Subtype', foreign_key: 'impact_type_id'
  belongs_to :term, class_name: 'Subtype', foreign_key: 'term_id'

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
