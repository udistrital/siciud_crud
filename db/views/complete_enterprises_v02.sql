SELECT ent.id,
       ent.name,
       ent.category_id,
       st.st_name AS category_name,
       ent.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       ent.comercial_name,
       ent.date_of_obtaining,
       ent.geo_city_id,
       gcity.name AS geo_city_name,
       ent.geo_country_id,
       gctry.name AS geo_country_name,
       ent.geo_state_id,
       gs.name    AS geo_state_name,
       ent.nit,
       ent.observation,
       ent.product_type_id,
       pt.st_name AS product_type_name,
       ent.research_group_id,
       ent.active,
       ent.created_by,
       ent.updated_by,
       ent.created_at,
       ent.updated_at
FROM enterprises ent
         LEFT JOIN subtypes st on ent.category_id = st.id
         LEFT JOIN colciencias_calls cc on ent.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ent.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on ent.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on ent.geo_country_id = gctry.id
         LEFT JOIN subtypes pt on ent.product_type_id = pt.id;