SELECT ds.id,
       ds.registration_title,
       ds.category_id,
       st.st_name AS category_name,
       ds.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       ds.date_of_obtaining,
       ds.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       ds.observation,
       ds.registration_number,
       ds.research_group_id,
       ds.active,
       ds.created_by,
       ds.updated_by,
       ds.created_at,
       ds.updated_at
FROM distinctive_signs ds
         LEFT JOIN subtypes st on ds.category_id = st.id
         LEFT JOIN colciencias_calls cc on ds.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ds.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;