class Dependency < ApplicationRecord
  include Swagger::DependencySchema

  belongs_to :entity

  has_many :hist_contacts

  has_and_belongs_to_many :proposals

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
