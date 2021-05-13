SELECT nab.id,
       nab.name,
       nab.category_id,
       stc.st_name AS category_name,
       nab.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       nab.date,
       nab.geo_city_id,
       gcity.name AS geo_city_name,
       nab.geo_country_id,
       gctry.name AS geo_country_name,
       nab.geo_state_id,
       gs.name AS geo_state_name,
       nab.petition_status_id,
       stpt.st_name AS petition_status_name,
       nab.observation,
       nab.research_group_id,
       nab.active,
       nab.created_by,
       nab.updated_by,
       nab.created_at,
       nab.updated_at
FROM new_animal_breeds nab
LEFT JOIN subtypes stc on nab.category_id = stc.id
LEFT JOIN colciencias_calls cc on nab.colciencias_call_id = cc.id
LEFT JOIN geo_cities gcity on nab.geo_city_id = gcity.id
LEFT JOIN geo_states gs on nab.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on nab.geo_country_id = gctry.id
LEFT JOIN subtypes stpt on nab.petition_status_id = stpt.id;