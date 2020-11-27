class OecdKnowledgeAreaSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :created_by, :updated_by, :created_at,
             :updated_at
end
