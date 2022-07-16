class KeywordSerializer < ActiveModel::Serializer
  attributes :id, :name, :active,
             :created_by, :updated_by, :created_at, :updated_at
end
