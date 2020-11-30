SELECT b.id,
       b.title,
       b.book_document,
       b.category_id,
       c.name AS category_name,
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
INNER JOIN categories c on b.category_id = c.id
INNER JOIN editorials e on b.editorial_id = e.id
INNER JOIN geo_cities gcity on b.geo_city_id = gcity.id
INNER JOIN geo_states gs on gcity.geo_state_id = gs.id
INNER JOIN geo_countries gctry on gs.geo_country_id = gctry.id;