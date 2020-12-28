SELECT bc.id,
       bc.book_title,
       bc.title,
       bc.book_chapter_document,
       bc.category_id,
       c.name AS category_name,
       bc.doi,
       bc.editorial_id,
       e.name AS editorial_name,
       bc.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       bc.isbn,
       bc.observation,
       bc.publication_date,
       bc.url,
       bc.active,
       bc.created_by,
       bc.updated_by,
       bc.created_at,
       bc.updated_at
FROM book_chapters bc
INNER JOIN categories c on bc.category_id = c.id
INNER JOIN editorials e on bc.editorial_id = e.id
INNER JOIN geo_cities gcity on bc.geo_city_id = gcity.id
INNER JOIN geo_states gs on gcity.geo_state_id = gs.id
INNER JOIN geo_countries gctry on gs.geo_country_id = gctry.id;