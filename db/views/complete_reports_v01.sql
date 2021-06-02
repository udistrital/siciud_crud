SELECT rp.id,
       rp.name,
       rp.category_id,
       st.st_name AS category_name,
       rp.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       rp.date_of_elaboration,
       rp.geo_city_id,
       gcity.name AS geo_city_name,
       rp.geo_country_id,
       gctry.name AS geo_country_name,
       rp.geo_state_id,
       gs.name    AS geo_state_name,
       rp.observation,
       rp.product_type_id,
       pdt.st_name AS product_type_name,
       rp.project_name,
       rp.research_group_id,
       rp.active,
       rp.created_by,
       rp.updated_by,
       rp.created_at,
       rp.updated_at
FROM reports rp
         LEFT JOIN subtypes st on rp.category_id = st.id
         LEFT JOIN colciencias_calls cc on rp.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on rp.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on rp.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on rp.geo_country_id = gctry.id
         LEFT JOIN subtypes pdt on rp.product_type_id = pdt.id;