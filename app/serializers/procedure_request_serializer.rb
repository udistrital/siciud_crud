class ProcedureRequestSerializer < ActiveModel::Serializer
  attributes :id, :approached_problem, :created_by, :updated_by, :active, :created_at, :updated_at
end
