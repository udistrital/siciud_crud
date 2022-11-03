class ItemDetail < ApplicationRecord
  include Swagger::ItemDetailSchema

  belongs_to :proposal_budget
  belongs_to :proposal
  belongs_to :source, class_name: 'Subtype', foreign_key: 'source_id', optional: true

  has_many :documents, as: :documentable

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
