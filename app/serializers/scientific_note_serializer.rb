class ScientificNoteSerializer < AbstractProductSerializer
  attributes :id, :title, :approval_date, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year, :doi, :final_page, :geo_city_id,
             :geo_city_name, :geo_country_id, :geo_country_name,
             :geo_state_id, :geo_state_name, :initial_page, :issn,
             :journal_name, :number_of_pages, :observation, :publication_date,
             :research_group_id, :url, :volume, :active, :created_by,
             :updated_by, :created_at, :updated_at
end
