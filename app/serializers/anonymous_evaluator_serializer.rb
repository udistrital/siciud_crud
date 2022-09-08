class AnonymousEvaluatorSerializer < ActiveModel::Serializer
  attributes :id, :code, :total, :active, :created_by, :updated_by
end
