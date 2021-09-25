class EntitySerializer < AbstractProductSerializer
  attributes :id, :name, :nit, :check_digit, :constitution_date,
             :legal_nature_id, :legal_representative_id, :institution_type_id,
             :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name,
             :headquarters_address, :email, :phone, :registration, :web_page,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def legal_nature_name
    legal_nature = self.object.legal_nature
    if legal_nature
      legal_nature.st_name
    end
  end

  def legal_representative_name
    legal_representative = self.object.legal_representative
    if legal_representative
      legal_representative.name
    end
  end

  def institution_type_name
    institution_type = self.object.institution_type
    if institution_type
      institution_type.st_name
    end
  end
end
