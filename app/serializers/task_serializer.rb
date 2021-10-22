class TaskSerializer < ActiveModel::Serializer
  attributes  :id, :intelectual_property_id, :desition, :created_by, :updated_by, :active,
              :otri_professional_id, :task_model_id, :request_has_procedure_id, :expired_date,
              :created_at, :updated_at
end
