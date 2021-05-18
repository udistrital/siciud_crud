SELECT reg.id,
       reg.title,
       reg.category_id,
       st.st_name AS category_name,
       reg.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       reg.date_of_publication,
       reg.geo_city_id,
       gcity.name AS geo_city_name,
       reg.geo_country_id,
       gctry.name AS geo_country_name,
       reg.geo_state_id,
       gs.name    AS geo_state_name,
       reg.issuing_entity,
       reg.observation,
       reg.product_type_id,
       pt.st_name AS product_type_name,
       reg.regulation_type_id,
       rt.st_name AS regulation_type_name,
       reg.research_group_id,
       reg.active,
       reg.created_by,
       reg.updated_by,
       reg.created_at,
       reg.updated_at
FROM regulations reg
         LEFT JOIN subtypes st on reg.category_id = st.id
         LEFT JOIN colciencias_calls cc on reg.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on reg.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on reg.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on reg.geo_country_id = gctry.id
         LEFT JOIN subtypes pt on reg.product_type_id = pt.id
         LEFT JOIN subtypes rt on reg.regulation_type_id = rt.id;