class Researcher < ApplicationRecord
  include Swagger::ResearcherSchema

  belongs_to :user, foreign_key: 'identification_number', primary_key: 'identification_number'
  has_many :periods
  has_many :int_participants

  validates :identification_number, presence: true, uniqueness: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
