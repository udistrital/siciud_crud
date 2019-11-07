class User < ApplicationRecord
  belongs_to :researcher
  has_and_belongs_to_many :user_roles
  validates :user_roles, presence: true
  validates :researcher, uniqueness: true
  validates :username, uniqueness: true

end
