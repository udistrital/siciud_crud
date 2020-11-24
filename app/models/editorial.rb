class Editorial < ApplicationRecord
  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
end
