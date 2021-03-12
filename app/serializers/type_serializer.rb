class TypeSerializer < ActiveModel::Serializer
  attributes :id, :t_parent_id, :t_name, :t_description, :active, :created_at, :updated_at,
             :created_by, :updated_by
end
