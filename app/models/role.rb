class Role < ApplicationRecord
    include Swagger::RoleSchema

    has_many :group_members

    validates :name, presence: true, uniqueness: true
    # Tracking inherited from ApplicationRecord, fields:
    # created_by and updated_by, see application_record.rb
    validate :validate_created_by, :validate_updated_by
end
