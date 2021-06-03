SELECT cpg.id,
       cpg.title,
       cpg.category_id,
       st.st_name AS category_name,
       cpg.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       cpg.date_of_publication,
       cpg.geo_city_id,
       gcity.name AS geo_city_name,
       cpg.geo_country_id,
       gctry.name AS geo_country_name,
       cpg.geo_state_id,
       gs.name    AS geo_state_name,
       cpg.isbn,
       cpg.observation,
       cpg.research_group_id,
       cpg.active,
       cpg.created_by,
       cpg.updated_by,
       cpg.created_at,
       cpg.updated_at
FROM clinical_practice_guidelines cpg
         LEFT JOIN subtypes st on cpg.category_id = st.id
         LEFT JOIN colciencias_calls cc on cpg.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on cpg.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on cpg.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on cpg.geo_country_id = gctry.id;
