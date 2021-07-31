class ActionPlan < ApplicationRecord
  include Swagger::ActionPlanSchema

  belongs_to :research_group

  has_many :form_a_act_plans
  has_many :form_b_act_plans
  has_many :form_c_act_plans
  has_many :form_d_act_plans

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
