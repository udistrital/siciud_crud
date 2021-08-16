class ProcedureRequest < ApplicationRecord
    include Swagger::ProcedureRequestSchema
    has_many :request_has_procedures
    has_one :technology_description
end
