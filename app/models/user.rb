class User < ApplicationRecord
  belongs_to :user_role

  validates :user_role, presence: true
  validates :identification_number, :oas_user_id, uniqueness: true

end
