class IndicatorSerializer < ActiveModel::Serializer
  attributes :id, :subtype_id, :subtype_name, :type_id, :type_name,
             :ind_description,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def subtype_name
    subtype = self.object.subtype
    if subtype
      subtype.st_name
    end
  end

  def type_id
    subtype = self.object.subtype
    if subtype
      subtype.type_id
    end
  end

  def type_name
    subtype = self.object.subtype
    if subtype
      type = subtype.type
      if type
        type.t_name
      end
    end
  end
end
