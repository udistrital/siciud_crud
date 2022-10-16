class ActivityEvaluationSerializer < ActiveModel::Serializer
  attributes :id, :notified_due_to_expire, :notified_expired,
             :state_id, :is_completed,
             :active, :created_by, :updated_by, :created_at, :updated_at
  has_one :activity_schedule
end
