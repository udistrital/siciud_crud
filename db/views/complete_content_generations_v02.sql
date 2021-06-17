SELECT cg.id,
       cg.bibliographic_reference,
       cg.category_id,
       st.st_name  AS category_name,
       cg.doi,
       cg.colciencias_call_id,
       cc.name     AS colciencias_call_name,
       cc.year     AS colciencias_call_year,
       cg.final_page,
       cg.generation_date,
       cg.geo_city_id,
       gcity.name  AS geo_city_name,
       cg.geo_country_id,
       gctry.name  AS geo_country_name,
       cg.geo_state_id,
       gs.name     AS geo_state_name,
       cg.isbn,
       cg.magazine_name,
       cg.pages_number,
       cg.observation,
       cg.product_type_id,
       pst.st_name AS product_type_name,
       cg.start_page,
       cg.title,
       cg.volume,
       cg.web_page,
       cg.active,
       cg.research_group_id,
       cg.created_by,
       cg.updated_by,
       cg.created_at,
       cg.updated_at
FROM content_generations cg
         LEFT JOIN subtypes st on cg.category_id = st.id
         LEFT JOIN colciencias_calls cc on cg.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on cg.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on cg.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on cg.geo_country_id = gctry.id
         LEFT JOIN subtypes pst on cg.product_type_id = pst.id;