class Role < ApplicationRecord
    include Swagger::RoleSchema

    belongs_to :role_type, class_name: 'Subtype', foreign_key: 'role_type_id', optional: true

    has_many :group_members

    validates :name, presence: true, uniqueness: true
    # Tracking inherited from ApplicationRecord, fields:
    # created_by and updated_by, see application_record.rb
    validate :validate_created_by, :validate_updated_by
end
