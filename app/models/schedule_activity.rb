class ScheduleActivity < ApplicationRecord
  include Swagger::ScheduleActivitySchema
  belongs_to :call

  validates :sa_order, :sa_description, :sa_date, :sa_responsible, presence: true
  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
