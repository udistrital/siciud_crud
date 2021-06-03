class Procedure < ApplicationRecord
    include Swagger::ProcedureSchema
    has_many :model_tasks
end
