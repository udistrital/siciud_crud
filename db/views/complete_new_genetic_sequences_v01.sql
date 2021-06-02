SELECT ngs.id,
       ngs.name,
       ngs.category_id,
       st.st_name AS category_name,
       ngs.certifying_institution,
       ngs.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       ngs.database_name,
       ngs.database_url,
       ngs.geo_city_id,
       gcity.name AS geo_city_name,
       ngs.geo_country_id,
       gctry.name AS geo_country_name,
       ngs.geo_state_id,
       gs.name    AS geo_state_name,
       ngs.observation,
       ngs.obtaining_date,
       ngs.research_group_id,
       ngs.active,
       ngs.created_by,
       ngs.updated_by,
       ngs.created_at,
       ngs.updated_at
FROM new_genetic_sequences ngs
         LEFT JOIN subtypes st on ngs.category_id = st.id
         LEFT JOIN colciencias_calls cc on ngs.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ngs.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on ngs.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on ngs.geo_country_id = gctry.id;