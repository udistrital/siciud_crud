SELECT cns.id,
       cns.title,
       cns.category_id,
       st.st_name AS category_name,
       cns.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       cns.consultation_date,
       cns.consulting_objective,
       cns.contract_number,
       cns.geo_city_id,
       gcity.name AS geo_city_name,
       cns.geo_country_id,
       gctry.name AS geo_country_name,
       cns.geo_state_id,
       gs.name    AS geo_state_name,
       cns.observation,
       cns.product_type_id,
       pdt.st_name AS product_type_name,
       cns.research_group_id,
       cns.active,
       cns.created_by,
       cns.updated_by,
       cns.created_at,
       cns.updated_at
FROM consultancies cns
         LEFT JOIN subtypes st on cns.category_id = st.id
         LEFT JOIN colciencias_calls cc on cns.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on cns.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on cns.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on cns.geo_country_id = gctry.id
         LEFT JOIN subtypes pdt on cns.product_type_id = pdt.id;