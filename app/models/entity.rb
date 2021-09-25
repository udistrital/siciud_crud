class Entity < ApplicationRecord
  belongs_to :legal_representative
  belongs_to :geo_city
  belongs_to :geo_country
  belongs_to :geo_state
  belongs_to :institution_type, class_name: 'Subtype', foreign_key: 'institution_type_id'
  belongs_to :legal_nature, class_name: 'Subtype', foreign_key: 'legal_nature_id'

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
