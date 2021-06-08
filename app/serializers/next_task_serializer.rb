class NextTaskSerializer < ActiveModel::Serializer
  attributes :id, :actual_task_id, :following_task_id, :created_by, :updated_by, :created_at, :updated_at

end
