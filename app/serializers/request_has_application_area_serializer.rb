class RequestHasApplicationAreaSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :updated_by, :active, :procedure_request_id, :application_area_id, :created_at, :updated_at
end
