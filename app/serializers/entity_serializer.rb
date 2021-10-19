class EntitySerializer < AbstractProductSerializer
  attributes :id, :name, :nit, :check_digit, :constitution_date,
             :legal_nature_id, :legal_nature_name, :legal_representative,
             :institution_type_id,
             :institution_type_name, :geo_city_id, :geo_city_name,
             :geo_country_id, :geo_country_name, :geo_state_id, :geo_state_name,
             :headquarters_address, :email, :phone, :registration, :web_page,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def legal_nature_name
    legal_nature = self.object.legal_nature
    if legal_nature
      legal_nature.st_name
    end
  end

  def legal_representative
    legal_representative = HistLegalRepresentative.where(
      "entity_id = ? AND is_current = true", self.object.id
    )
    if legal_representative
      lr = legal_representative[0]
      {
        "id": lr.id,
        "legal_representative_id": lr.legal_representative_id,
        "legal_representative_name": lr.legal_representative.name,
        "legal_representative_email": lr.legal_representative.email,
        "is_current": lr.is_current
      }
    else
      {}
    end
  end

  def institution_type_name
    institution_type = self.object.institution_type
    if institution_type
      institution_type.st_name
    end
  end
end
