class OecdDisciplineSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :oecd_knowledge_subarea_id, :active,
             :created_by, :updated_by, :created_at, :updated_at
end
