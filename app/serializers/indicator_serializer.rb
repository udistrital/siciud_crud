class IndicatorSerializer < ActiveModel::Serializer
  attributes :id, :subtype_id, :subtype_name, :ind_description,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def subtype_name
    subtype = self.object.subtype
    if subtype
      subtype.st_name
    end
  end
end
