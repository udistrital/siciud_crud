SELECT cw.id,
       cw.name,
       cw.category_id,
       st.st_name AS category_name,
       cw.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       cw.funding_institution,
       cw.geo_city_id,
       gcity.name AS geo_city_name,
       cw.geo_country_id,
       gctry.name AS geo_country_name,
       cw.geo_state_id,
       gs.name    AS geo_state_name,
       cw.start_date,
       cw.finish_date,
       cw.observation,
       cw.organization_name,
       cw.participation_id,
       prst.st_name AS participation_name,
       cw.research_group_id,
       cw.active,
       cw.created_by,
       cw.updated_by,
       cw.created_at,
       cw.updated_at
FROM creation_workshops cw
         LEFT JOIN subtypes st on cw.category_id = st.id
         LEFT JOIN colciencias_calls cc on cw.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on cw.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on cw.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on cw.geo_country_id = gctry.id
         LEFT JOIN subtypes prst on cw.participation_id = prst.id;