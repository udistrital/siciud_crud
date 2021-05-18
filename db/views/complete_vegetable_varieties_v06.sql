SELECT vv.id,
       vv.name,
       vv.category_id,
       stc.st_name AS category_name,
       vv.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       vv.cycle_type_id,
       stcc.st_name AS cycle_type_name,
       vv.date,
       vv.geo_city_id,
       gcity.name AS geo_city_name,
       vv.geo_country_id,
       gctry.name AS geo_country_name,
       vv.geo_state_id,
       gs.name AS geo_state_name,
       vv.petition_status_id,
       stpt.st_name AS petition_status_name,
       vv.observation,
       vv.research_group_id,
       vv.active,
       vv.created_by,
       vv.updated_by,
       vv.created_at,
       vv.updated_at
FROM vegetable_varieties vv
LEFT JOIN subtypes stc on vv.category_id = stc.id
LEFT JOIN colciencias_calls cc on vv.colciencias_call_id = cc.id
LEFT JOIN subtypes stcc on vv.cycle_type_id = stcc.id
LEFT JOIN geo_cities gcity on vv.geo_city_id = gcity.id
LEFT JOIN geo_states gs on vv.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on vv.geo_country_id = gctry.id
LEFT JOIN subtypes stpt on vv.petition_status_id = stpt.id;