SELECT inn.id,
       inn.name,
       inn.category_id,
       st.st_name AS category_name,
       inn.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       inn.company_name,
       inn.date_of_obtaining,
       inn.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       inn.nit,
       inn.observation,
       inn.product_type_id,
       pt.st_name AS product_type_name,
       inn.research_group_id,
       inn.active,
       inn.created_by,
       inn.updated_by,
       inn.created_at,
       inn.updated_at
FROM innovations inn
         LEFT JOIN subtypes st on inn.category_id = st.id
         LEFT JOIN colciencias_calls cc on inn.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on inn.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id
         LEFT JOIN subtypes pt on inn.product_type_id = pt.id;