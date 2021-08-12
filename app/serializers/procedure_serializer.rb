class ProcedureSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_by, :updated_by, :created_at, :updated_at, :active
end
