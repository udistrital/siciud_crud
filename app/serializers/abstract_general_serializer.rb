class AbstractGeneralSerializer < ActiveModel::Serializer

  def created_by
    c_by = self.object.created_by
    if c_by
      c_by.id
    end
  end

  def updated_by
    u_by = self.object.updated_by
    if u_by
      u_by.id
    end
  end
end
