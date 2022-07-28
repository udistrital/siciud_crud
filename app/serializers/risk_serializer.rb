class RiskSerializer < ActiveModel::Serializer
  attributes :id, :name, :consequence, :mitigation,
             :activity_schedule_ids, :proposal_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
