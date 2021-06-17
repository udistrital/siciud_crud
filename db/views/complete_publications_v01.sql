SELECT p.category_id,
       st.st_name AS category_name,
       p.circulation_route,
       p.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       p.duration,
       p.duration_type_id,
       p.funding_institution,
       p.final_date,
       p.geo_city_id,
       gcity.name AS geo_city_name,
       p.geo_country_id,
       gctry.name AS geo_country_name,
       p.geo_state_id,
       gs.name    AS geo_state_name,
       p.name,
       p.observation,
       p.project_title,
       p.start_date,
       p.target_audiences,
       p.url,
       p.active,
       p.research_group_id,
       p.created_by,
       p.updated_by,
       p.created_at,
       p.updated_at
FROM publications p
         LEFT JOIN subtypes st on p.category_id = st.id
         LEFT JOIN colciencias_calls cc on p.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on p.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on p.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on p.geo_country_id = gctry.id;