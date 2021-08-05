class ReadAttributeSerializer < ActiveModel::Serializer
  attributes :id, :task_model_id, :task_attribute_id, :created_by, :updated_by, :created_at, :updated_at

end
