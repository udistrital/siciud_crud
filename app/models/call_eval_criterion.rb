class CallEvalCriterion < ApplicationRecord
  include Swagger::CallEvalCriterionSchema

  belongs_to :call
  belongs_to :eval_criterion, class_name: 'Subtype', foreign_key: 'eval_criterion_id'

  validates :cec_percentage, presence: true
  validates :cec_percentage, numericality: { greater_than_or_equal_to: 0,
                                             less_than_or_equal_to: 100 }

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
