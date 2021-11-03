class RequestHasProcedureSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :updated_by, :active, :procedure_id, :procedure_request_id, :procedure_name, :created_at, :updated_at

  def procedure_name
    procedure = self.object.procedure
    if procedure
      procedure.name
    end
  end

end
