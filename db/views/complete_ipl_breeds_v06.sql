SELECT iplb.id,
       iplb.name,
       iplb.category_id,
       stc.st_name AS category_name,
       iplb.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       iplb.consecutive_number_ma,
       iplb.geo_city_id,
       gcity.name AS geo_city_name,
       iplb.geo_country_id,
       gctry.name AS geo_country_name,
       iplb.geo_state_id,
       gs.name AS geo_state_name,
       iplb.observation,
       iplb.publication_date,
       iplb.research_group_id,
       iplb.active,
       iplb.created_by,
       iplb.updated_by,
       iplb.created_at,
       iplb.updated_at
FROM ip_livestock_breeds iplb
LEFT JOIN subtypes stc on iplb.category_id = stc.id
LEFT JOIN colciencias_calls cc on iplb.colciencias_call_id = cc.id
LEFT JOIN geo_cities gcity on iplb.geo_city_id = gcity.id
LEFT JOIN geo_states gs on iplb.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on iplb.geo_country_id = gctry.id;