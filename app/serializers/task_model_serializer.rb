class TaskModelSerializer < ActiveModel::Serializer
  attributes  :id, :name, :duration, :procedure_name, :procedure_id, 
              :professional_role_id, :professional_role_name, :created_by, 
              :updated_by , :created_at, :updated_at, :active


  def procedure_name
    procedure = self.object.procedure
    if procedure
      procedure.name
    end
  end

  def procedure_id
    procedure = self.object.procedure
    if procedure
      procedure.id
    end
  end


  def professional_role_name
    professional_role = self.object.professional_role
    if professional_role
      professional_role.name
    end
  end

  def professional_role_id
    professional_role = self.object.professional_role
    if professional_role
      professional_role.id
    end
  end
end
