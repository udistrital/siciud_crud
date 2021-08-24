class FormDActPlan < ApplicationRecord

  belongs_to :action_plan
  belongs_to :goal_state, class_name: 'Subtype', foreign_key: 'goal_state_id'
  belongs_to :plan_type, class_name: 'Subtype', foreign_key: 'plan_type_id'

  has_and_belongs_to_many :cine_specific_areas
  has_and_belongs_to_many :cine_detailed_areas
  has_and_belongs_to_many :oecd_knowledge_subareas
  has_and_belongs_to_many :oecd_disciplines

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
