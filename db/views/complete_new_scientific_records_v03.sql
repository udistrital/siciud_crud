SELECT nsr.id,
       nsr.category_id,
       st.st_name AS category_name,
       nsr.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       nsr.geo_city_id,
       gcity.name AS geo_city_name,
       nsr.geo_country_id,
       gctry.name AS geo_country_name,
       nsr.geo_state_id,
       gs.name AS geo_state_name,
       nsr.nsr_name,
       nsr.nsr_date_of_obtaining,
       nsr.nsr_database_name,
       nsr.nsr_database_url,
       nsr.nsr_certifying_institution,
       nsr.nsr_issuing_institution,
       nsr.observation,
       nsr.research_group_id,
       nsr.active,
       nsr.created_by,
       nsr.updated_by,
       nsr.created_at,
       nsr.updated_at
FROM new_scientific_records nsr
         LEFT JOIN subtypes st on nsr.category_id = st.id
         LEFT JOIN colciencias_calls cc on nsr.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on nsr.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on nsr.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on nsr.geo_country_id = gctry.id;