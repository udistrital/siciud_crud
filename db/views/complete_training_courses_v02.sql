SELECT tc.id,
       tc.category_id,
       st.st_name AS category_name,
       tc.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       tc.date,
       tc.faculty,
       tc.geo_city_id,
       gcity.name AS geo_city_name,
       tc.geo_country_id,
       gctry.name AS geo_country_name,
       tc.geo_state_id,
       gs.name    AS geo_state_name,
       tc.id_administrative_act,
       tc.institution,
       tc.num_administrative_act,
       tc.observation,
       tc.program_name,
       tc.active,
       tc.research_group_id,
       tc.created_by,
       tc.updated_by,
       tc.created_at,
       tc.updated_at
FROM training_courses tc
         LEFT JOIN subtypes st on tc.category_id = st.id
         LEFT JOIN colciencias_calls cc on tc.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on tc.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on tc.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on tc.geo_country_id = gctry.id