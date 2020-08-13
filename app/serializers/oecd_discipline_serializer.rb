class OecdDisciplineSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :oecd_knowledge_subarea_id
end
