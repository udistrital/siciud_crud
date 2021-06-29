class UserRole < ApplicationRecord
  include Swagger::UserRoleSchema

  has_many :users

  validates :name, presence: true, uniqueness: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validate :validate_created_by, :validate_updated_by
end
