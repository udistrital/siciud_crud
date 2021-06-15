SELECT iip.id,
       iip.category_id,
       st.st_name AS category_name,
       iip.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       iip.contract_number,
       iip.funding_institution,
       iip.geo_city_id,
       gcity.name AS geo_city_name,
       iip.geo_country_id,
       gctry.name AS geo_country_name,
       iip.geo_state_id,
       gs.name    AS geo_state_name,
       iip.institution,
       iip.observation,
       iip.title,
       iip.year,
       iip.active,
       iip.research_group_id,
       iip.created_by,
       iip.updated_by,
       iip.created_at,
       iip.updated_at
FROM idi_investigation_projects iip
         LEFT JOIN subtypes st on iip.category_id = st.id
         LEFT JOIN colciencias_calls cc on iip.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on iip.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on iip.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on iip.geo_country_id = gctry.id