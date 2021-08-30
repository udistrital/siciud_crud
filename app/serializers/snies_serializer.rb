class SniesSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :created_by, :updated_by
end
