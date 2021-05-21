class UserRole < ApplicationRecord
  include Swagger::UserRoleSchema

  has_one :user

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :name, presence: true, allow_blank: false, on: :create
  validates :name, exclusion: { in: [nil], message: "can't be nil" }
  validate :validate_created_by, :validate_updated_by
end
