SELECT gm.id,
       gm.title,
       gm.category_id,
       st.st_name AS category_name,
       gm.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       gm.date_of_publication,
       gm.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       gm.observation,
       gm.product_type_id,
       pt.st_name AS product_type_name,
       gm.research_group_id,
       gm.url,
       gm.active,
       gm.created_by,
       gm.updated_by,
       gm.created_at,
       gm.updated_at
FROM guide_manuals gm
         LEFT JOIN subtypes st on gm.category_id = st.id
         LEFT JOIN colciencias_calls cc on gm.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on gm.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id
         LEFT JOIN subtypes pt on gm.product_type_id = pt.id;