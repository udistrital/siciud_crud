class WorkingPaperSerializer < AbstractProductSerializer
  attributes :id, :title, :elaboration_date, :related_institution, :doi,
             :web_page, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
