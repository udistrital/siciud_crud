class User < ApplicationRecord
  belongs_to :researcher
  has_and_belongs_to_many :user_roles
end
