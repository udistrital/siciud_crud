class UserRole < ApplicationRecord
  include Swagger::UserRoleSchema

  has_one :user
end
