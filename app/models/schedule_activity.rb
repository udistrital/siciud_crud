class ScheduleActivity < ApplicationRecord
  include Swagger::ScheduleActivitySchema
  belongs_to :call

  validates :sa_order, :sa_description, :sa_date, :sa_responsible, presence: true
  validate :val_end_date_after_start_date
  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by


  def val_end_date_after_start_date
    return if self.sa_end_date.blank? || self.sa_start_date.blank?

    if self.sa_end_date < self.sa_start_date
      errors.add(:sa_end_date, "must be after the start date")
    end
  end
end
