class SubtypeSerializer < ActiveModel::Serializer
  attributes :id, :st_name, :st_description, :parent_id, :active,
             :created_at, :updated_at, :created_by, :updated_by
  has_one :type
end
