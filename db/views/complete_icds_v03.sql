SELECT icd.id,
       icd.category_id,
       st.st_name AS category_name,
       icd.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       icd.geo_city_id,
       gcity.name AS geo_city_name,
       icd.geo_country_id,
       gctry.name AS geo_country_name,
       icd.geo_state_id,
       gs.name AS geo_state_name,
       icd.icd_date_of_obtaining,
       icd.icd_registration_number,
       icd.icd_registration_title,
       icd.observation,
       icd.research_group_id,
       icd.active,
       icd.created_by,
       icd.updated_by,
       icd.created_at,
       icd.updated_at
FROM integrated_circuit_diagrams icd
         LEFT JOIN subtypes st on icd.category_id = st.id
         LEFT JOIN colciencias_calls cc on icd.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on icd.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on icd.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on icd.geo_country_id = gctry.id;