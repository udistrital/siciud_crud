class TechnologicalSituationSerializer < ActiveModel::Serializer
  attributes :id, :invention_type_id, :required_equipment, :pending_development, 
             :differential_factors, :pi_requested, :media_spread, :channel_spread, 
             :procedure_request_id, :spread_plans, :created_by, :updated_by, :active,
             :development_stage_ids, :technology_reason_ids, :created_at, :updated_at

end
