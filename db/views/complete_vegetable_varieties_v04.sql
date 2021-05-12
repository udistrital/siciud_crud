SELECT vv.id,
       vv.name,
       vv.date,
       vv.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       vv.observation,
       vv.research_group_id,
       vv.active,
       vv.created_by,
       vv.updated_by,
       vv.created_at,
       vv.updated_at
FROM vegetable_varieties vv
LEFT JOIN geo_cities gcity on vv.geo_city_id = gcity.id
LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;