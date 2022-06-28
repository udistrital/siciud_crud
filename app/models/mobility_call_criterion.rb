class MobilityCallCriterion < ApplicationRecord
  include Swagger::MobilityCallCriterionSchema

  belongs_to :mobility_call
  belongs_to :call_eval_criterion

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
