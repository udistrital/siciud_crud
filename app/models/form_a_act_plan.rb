class FormAActPlan < ApplicationRecord

  belongs_to :action_plan
  belongs_to :indicator
  belongs_to :plan_type, class_name: 'Subtype', foreign_key: 'plan_type_id'
  belongs_to :product_type, class_name: 'Subtype', foreign_key: 'product_type_id'

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
