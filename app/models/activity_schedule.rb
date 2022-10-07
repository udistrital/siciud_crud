class ActivitySchedule < ApplicationRecord
  include Swagger::ActivityScheduleSchema

  belongs_to :proposal

  has_one :activity_evaluation
  has_and_belongs_to_many :objectives
  has_and_belongs_to_many :risks

  validates :duration, numericality: { greater_than_or_equal_to: 0 }

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
