class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true
  belongs_to :document_type, class_name: 'Subtype', optional: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :doc_name, :doc_path, presence: true, allow_blank: false, on: :create
  validates :doc_name, :doc_path, exclusion: { in: [nil], message: "can't be nil" }
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
