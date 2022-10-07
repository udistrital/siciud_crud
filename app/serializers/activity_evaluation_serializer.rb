class ActivityEvaluationSerializer < ActiveModel::Serializer
  attributes :id, :notified_due_to_expire, :notified_expired, :state_id, :active, :created_by, :updated_by
  has_one :activity_schedule
end
