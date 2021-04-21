class UserRoleSerializer < ActiveModel::Serializer
  attributes :id, :name,
             :active, :created_at, :updated_at,
             :created_by, :updated_by
end
