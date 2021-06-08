class TaskAttributeSerializer < ActiveModel::Serializer
  attributes  :id, :task_model_id, :attribute_sub_type_id, 
              :created_by, :updated_by, :created_at, :updated_at
end
