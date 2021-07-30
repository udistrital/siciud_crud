class CallDocument < ApplicationRecord
  include Swagger::CallDocumentSchema

  belongs_to :call
  belongs_to :document, class_name: 'Subtype', foreign_key: 'document_id'

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
