class Call < ApplicationRecord
  include Swagger::CallSchema

  belongs_to :call_beneficiary, class_name: 'Subtype', foreign_key: 'call_beneficiary_id'
  belongs_to :call_state, class_name: 'Subtype', foreign_key: 'call_state_id', optional: true
  belongs_to :call_type, class_name: 'Subtype', foreign_key: 'call_type_id'

  has_many :call_items
  has_many :items, through: :call_items, source: :item
  has_many :calls_indicators
  has_many :indicators, through: :calls_indicators
  has_many :call_documents
  has_many :c_documents, through: :call_documents, source: :document
  has_many :call_eval_criteria
  has_many :eval_criteria, through: :call_eval_criteria, source: :eval_criterion
  has_many :schedule_activities
  has_many :proposals
  has_many :mobility_calls

  has_many :chapters, as: :sectionable

  has_many :documents, as: :documentable

  validates :call_name, presence: true
  validates :call_code, uniqueness: true
  validates :call_duration,
            :call_global_budget,
            :call_max_budget_per_project, numericality: { greater_than_or_equal_to: 0 }
  validates :call_max_budget_per_project, numericality: { less_than_or_equal_to: :call_global_budget }

  validate :validate_start_end_date

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by

  def validate_start_end_date
    if call_start_date.present? and call_end_date.present?
      unless call_start_date <= call_end_date
        errors.add(:call_start_date, "can't be later than call_end_date")
      end
    end
  end
end
