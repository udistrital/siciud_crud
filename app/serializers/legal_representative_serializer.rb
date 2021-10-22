class LegalRepresentativeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :identification_number,
             :identification_type_id, :identification_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def identification_type_name
    identification_type = self.object.identification_type
    if identification_type
      identification_type.st_name
    end
  end
end
