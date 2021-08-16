class RequestHasProcedure < ApplicationRecord
  include Swagger::RequestHasProcedureSchema
  belongs_to :procedure
  belongs_to :procedure_request
end
