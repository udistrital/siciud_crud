class ProposalProduct < ApplicationRecord
  include Swagger::ProposalProductSchema

  belongs_to :indicator
  belongs_to :product_type, class_name: 'Subtype', foreign_key: 'product_type_id'
  belongs_to :proposal

  has_and_belongs_to_many :researchers

  has_many :documents, as: :documentable

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
