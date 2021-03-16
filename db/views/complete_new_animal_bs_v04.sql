SELECT nab.id,
       nab.name,
       nab.date,
       nab.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       nab.observation,
       nab.research_group_id,
       nab.active,
       nab.created_by,
       nab.updated_by,
       nab.created_at,
       nab.updated_at
FROM new_animal_breeds nab
LEFT JOIN geo_cities gcity on nab.geo_city_id = gcity.id
LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;