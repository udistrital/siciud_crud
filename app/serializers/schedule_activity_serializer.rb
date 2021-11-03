class ScheduleActivitySerializer < ActiveModel::Serializer
  attributes :id, :call_id, :sa_order, :sa_description,
             :sa_date, :sa_start_date, :sa_end_date,
             :sa_responsible, :active, :created_by,
             :updated_by, :created_at, :updated_at
end
