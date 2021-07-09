class Call < ApplicationRecord
  include Swagger::CallSchema

  belongs_to :call_beneficiary, class_name: 'Subtype', foreign_key: 'call_beneficiary_id', optional: true
  belongs_to :call_state, class_name: 'Subtype', foreign_key: 'call_state_id', optional: true
  belongs_to :call_type, class_name: 'Subtype', foreign_key: 'call_type_id', optional: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
