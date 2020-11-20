class User < ApplicationRecord
  belongs_to :user_role

  puts "!!!!!!!!!!!!!!!!"
  validates :user_role, presence: true
  validates :identification_number, :oas_user_id, uniqueness: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: true, if: :user_role_admin?
  validates :created_by, presence: true, allow_nil: false, unless: :user_role_admin?

  def user_role_admin?
    user_role.id == 1
  end
end
