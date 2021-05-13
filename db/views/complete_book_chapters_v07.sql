SELECT bc.id,
       bc.book_title,
       bc.title,
       bc.category_id,
       st.st_name AS category_name,
       bc.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       bc.doi,
       bc.editorial_name,
       bc.geo_city_id,
       gcity.name AS geo_city_name,
       bc.geo_country_id,
       gctry.name AS geo_country_name,
       bc.geo_state_id,
       gs.name    AS geo_state_name,
       bc.isbn,
       bc.observation,
       bc.publication_date,
       bc.research_group_id,
       bc.url,
       bc.active,
       bc.created_by,
       bc.updated_by,
       bc.created_at,
       bc.updated_at
FROM book_chapters bc
         LEFT JOIN subtypes st on bc.category_id = st.id
         LEFT JOIN colciencias_calls cc on bc.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on bc.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on bc.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on bc.geo_country_id = gctry.id;