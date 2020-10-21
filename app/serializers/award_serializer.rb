class AwardSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_national, :research_creation_work_id
end
