SELECT b.id,
       b.title,
       b.book_type_id,
       tbk.st_name AS book_type_name,
       b.category_id,
       st.st_name AS category_name,
       b.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       b.editorial_name,
       b.geo_city_id,
       gcity.name AS geo_city_name,
       b.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       b.isbn,
       b.observation,
       b.publication_date,
       b.research_group_id,
       b.url,
       b.active,
       b.created_by,
       b.updated_by,
       b.created_at,
       b.updated_at
FROM books b
LEFT JOIN subtypes st on b.category_id = st.id
LEFT JOIN subtypes tbk on b.book_type_id = tbk.id
LEFT JOIN colciencias_calls cc on b.colciencias_call_id = cc.id
LEFT JOIN geo_cities gcity on b.geo_city_id = gcity.id
LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on b.geo_country_id = gctry.id;