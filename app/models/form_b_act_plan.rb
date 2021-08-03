class FormBActPlan < ApplicationRecord
  include Swagger::FormBActPlanSchema

  belongs_to :action_plan
  belongs_to :financing_type, class_name: 'Subtype', foreign_key: 'financing_type_id'
  belongs_to :goal_state, class_name: 'Subtype', foreign_key: 'goal_state_id'
  belongs_to :plan_type, class_name: 'Subtype', foreign_key: 'plan_type_id'

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
