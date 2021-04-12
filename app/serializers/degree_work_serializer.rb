class DegreeWorkSerializer < AbstractProductSerializer
  attributes :id, :dw_title, :dw_date, :dw_institution_name, :dw_recognition,
             :category_id, :category_name, :colciencias_call_id,
             :colciencias_call_name, :colciencias_call_year,
             :dw_observation, :dw_type_id, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
