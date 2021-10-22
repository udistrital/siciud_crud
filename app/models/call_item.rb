class CallItem < ApplicationRecord
  include Swagger::CallItemSchema

  belongs_to :call
  belongs_to :item, class_name: 'Subtype', foreign_key: 'item_id'

  validates :ci_maximum_percentage, :ci_percentage, presence: true
  validates :ci_maximum_percentage, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100 }
  validates :ci_percentage, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: :ci_maximum_percentage }

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
