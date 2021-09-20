class FunctionalApplicationSerializer < ActiveModel::Serializer
  attributes  :id, :actual_applications, :future_applications, 
              :alternative_technologies, :advantages, :created_by, 
              :updated_by, :active, :created_at, :updated_at, :procedure_request_id
end
