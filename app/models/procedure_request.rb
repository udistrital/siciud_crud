class ProcedureRequest < ApplicationRecord
    include Swagger::ProcedureRequestSchema
    has_many :request_has_procedures
    has_one :technology_description
    has_many :request_has_application_areas
    has_one :potential_market
end
