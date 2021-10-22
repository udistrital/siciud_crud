class RequestHasApplicationArea < ApplicationRecord
  include Swagger::RequestHasApplicationAreaSchema
  belongs_to :procedure_request
  belongs_to :application_areas, class_name: 'Subtype', foreign_key: 'application_area_id'
end
