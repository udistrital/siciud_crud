class LicenseAgreementSerializer < AbstractProductSerializer
  attributes :id, :work_name, :license_grant_date, :contract_date,
             :ncd_registry_number, :license_owner_institution,
             :contract_geo_city_id, :contract_geo_city_name, :contract_geo_state_id,
             :contract_geo_state_name, :contract_geo_country_id, :contract_geo_country_name,
             :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def contract_geo_city_name
    contract_geo_city = self.object.contract_geo_city
    if contract_geo_city
      contract_geo_city.name
    end
  end

  def contract_geo_state_id
    contract_geo_city = self.object.contract_geo_city
    if contract_geo_city
      contract_geo_state = GeoState.find(contract_geo_city.geo_state_id)
      if contract_geo_state
        contract_geo_state.id
      end
    end
  end

  def contract_geo_state_name
    contract_geo_city = self.object.contract_geo_city
    if contract_geo_city
      contract_geo_state = GeoState.find(contract_geo_city.geo_state_id)
      if contract_geo_state
        contract_geo_state.name
      end
    end
  end

  def contract_geo_country_id
    contract_geo_city = self.object.contract_geo_city
    if contract_geo_city
      contract_geo_state = GeoState.find(contract_geo_city.geo_state_id)
      if contract_geo_state
        contract_geo_country = GeoCountry.find(contract_geo_state.geo_country_id)
        if contract_geo_country
          contract_geo_country.id
        end
      end
    end
  end

  def contract_geo_country_name
    contract_geo_city = self.object.contract_geo_city
    if contract_geo_city
      contract_geo_state = GeoState.find(contract_geo_city.geo_state_id)
      if contract_geo_state
        contract_geo_country = GeoCountry.find(contract_geo_state.geo_country_id)
        if contract_geo_country
          contract_geo_country.name
        end
      end
    end
  end

end
