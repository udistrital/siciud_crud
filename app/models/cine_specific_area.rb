class CineSpecificArea < ApplicationRecord
  include Swagger::CineSpecificAreaSchema

  belongs_to :cine_broad_area
  has_and_belongs_to_many :form_d_act_plans
  has_many :research_groups

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validate :validate_created_by, :validate_updated_by
end
