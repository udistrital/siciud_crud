SELECT pac.id,
       pac.title,
       pac.category_id,
       st.st_name AS category_name,
       pac.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       pac.date_of_publication,
       pac.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       pac.observation,
       pac.product_type_id,
       pt.st_name AS product_type_name,
       pac.research_group_id,
       pac.active,
       pac.created_by,
       pac.updated_by,
       pac.created_at,
       pac.updated_at
FROM protocol_acts pac
         LEFT JOIN subtypes st on pac.category_id = st.id
         LEFT JOIN colciencias_calls cc on pac.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on pac.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id
         LEFT JOIN subtypes pt on pac.product_type_id = pt.id;