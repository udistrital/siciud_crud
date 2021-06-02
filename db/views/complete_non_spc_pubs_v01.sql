SELECT nsp.id,
       nsp.name,
       nsp.category_id,
       st.st_name AS category_name,
       nsp.circulation_route,
       nsp.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       nsp.final_date,
       nsp.funding_institution,
       nsp.geo_city_id,
       gcity.name AS geo_city_name,
       nsp.geo_country_id,
       gctry.name AS geo_country_name,
       nsp.geo_state_id,
       gs.name    AS geo_state_name,
       nsp.observation,
       nsp.research_group_id,
       nsp.start_date,
       nsp.target_audiences,
       nsp.url,
       nsp.active,
       nsp.created_by,
       nsp.updated_by,
       nsp.created_at,
       nsp.updated_at
FROM non_specialized_publications nsp
         LEFT JOIN subtypes st on nsp.category_id = st.id
         LEFT JOIN colciencias_calls cc on nsp.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on nsp.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on nsp.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on nsp.geo_country_id = gctry.id;