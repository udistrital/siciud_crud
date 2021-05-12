SELECT b.id,
       b.title,
       b.category_id,
       st.st_name AS category_name,
       b.editorial_id,
       e.name AS editorial_name,
       b.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
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
LEFT JOIN editorials e on b.editorial_id = e.id
LEFT JOIN geo_cities gcity on b.geo_city_id = gcity.id
LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;