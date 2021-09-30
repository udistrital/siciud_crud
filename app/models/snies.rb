class Snies < ApplicationRecord
  include Swagger::SniesSchema

  has_and_belongs_to_many :form_d_act_plans
  has_and_belongs_to_many :research_networks

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validate :validate_created_by, :validate_updated_by
end
