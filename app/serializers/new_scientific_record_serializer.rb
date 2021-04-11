class NewScientificRecordSerializer < ActiveModel::Serializer
  attributes :id, :nsr_name, :nsr_date_of_obtaining, :nsr_database_name,
             :nsr_database_url, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year, :geo_country_id, :geo_country_name,
             :nsr_certifying_institution, :nsr_issuing_institution,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
