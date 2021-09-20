class Procedure < ApplicationRecord
    include Swagger::ProcedureSchema
    has_many :model_tasks
    has_many :request_has_procedure
end
