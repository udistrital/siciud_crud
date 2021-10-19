class LegalRepresentative < ApplicationRecord
  include Swagger::LegalRepresentativeSchema

  belongs_to :identification_type, class_name: 'Subtype', foreign_key: 'identification_type_id'
  has_many :hist_legal_representatives

  validates :identification_number, uniqueness: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
