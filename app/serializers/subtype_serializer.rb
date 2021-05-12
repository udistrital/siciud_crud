class SubtypeSerializer < ActiveModel::Serializer
  attributes :id, :st_name, :st_description, :parent_id,
             :parent_name, :type_id, :type_name,:active,
             :created_at, :updated_at, :created_by, :updated_by

  def parent_name
    parent = self.object.parent
    if parent
      parent.st_name
    end
  end

  def type_name
    type = self.object.type
    if type
      type.t_name
    end
  end

end
