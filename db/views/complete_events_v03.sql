SELECT eve.id,
       eve.category_id,
       st.st_name  AS category_name,
       eve.colciencias_call_id,
       cc.name     AS colciencias_call_name,
       cc.year     AS colciencias_call_year,
       eve.eve_name,
       eve.eve_start_date,
       eve.eve_finish_date,
       eve.eve_organizers,
       eve.eve_entities,
       eve.eve_observation,
       eve.eve_type_id,
       evt.st_name AS eve_type_name,
       eve.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       eve.participation_id,
       part.st_name AS participation_name,
       eve.research_group_id,
       eve.active,
       eve.created_by,
       eve.updated_by,
       eve.created_at,
       eve.updated_at
FROM events eve
         LEFT JOIN subtypes st on eve.category_id = st.id
         LEFT JOIN subtypes evt on eve.eve_type_id = evt.id
         LEFT JOIN subtypes part on eve.participation_id = part.id
         LEFT JOIN colciencias_calls cc on eve.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on eve.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;