class OecdKnowledgeSubareaSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :oecd_knowledge_area_id, :active,
             :created_by, :updated_by, :created_at, :updated_at
end
