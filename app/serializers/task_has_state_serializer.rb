class TaskHasStateSerializer < ActiveModel::Serializer
  attributes  :id, :state_id, :created_by, :updated_by, :active,
              :task_id, :created_at, :updated_at
end
