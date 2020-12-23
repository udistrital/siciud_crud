class User < ApplicationRecord
  belongs_to :user_role

  validates :user_role, presence: true
  validates :identification_number, uniqueness: {
      scope: [:user_role_id, :oas_user_id],
      message: 'should only one identification_number and oas_user_id per user role'
  }

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: true, if: :user_role_admin?
  validates :created_by, presence: true, allow_nil: false, unless: :user_role_admin?
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by

  def user_role_admin?
    user_role.id == 1
  end
end
