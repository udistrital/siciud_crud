class ActivityScheduleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_date, :end_date,
             :duration, :deliverable, :objective_ids, :proposal_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
