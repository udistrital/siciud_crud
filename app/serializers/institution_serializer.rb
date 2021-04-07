class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :inst_name, :active, :created_by,
             :updated_by, :created_at, :updated_at
end
