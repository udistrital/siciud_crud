SELECT tc.id,
       tc.title,
       tc.category_id,
       st.st_name AS category_name,
       tc.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       tc.consecutive_number,
       tc.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       tc.observation,
       tc.request_date,
       tc.requesting_institution_name,
       tc.research_group_id,
       tc.send_date,
       tc.active,
       tc.created_by,
       tc.updated_by,
       tc.created_at,
       tc.updated_at
FROM technical_concepts tc
         LEFT JOIN subtypes st on tc.category_id = st.id
         LEFT JOIN colciencias_calls cc on tc.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on tc.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;