SELECT kn.id,
       kn.name,
       kn.category_id,
       st.st_name AS category_name,
       kn.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       kn.funding_community,
       kn.funding_institution,
       kn.geo_city_id,
       gcity.name AS geo_city_name,
       kn.geo_country_id,
       gctry.name AS geo_country_name,
       kn.geo_state_id,
       gs.name    AS geo_state_name,
       kn.start_date,
       kn.finish_date,
       kn.observation,
       kn.research_group_id,
       kn.web_page,
       kn.active,
       kn.created_by,
       kn.updated_by,
       kn.created_at,
       kn.updated_at
FROM knowledge_networks kn
         LEFT JOIN subtypes st on kn.category_id = st.id
         LEFT JOIN colciencias_calls cc on kn.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on kn.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on kn.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on kn.geo_country_id = gctry.id;