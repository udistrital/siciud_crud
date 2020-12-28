SELECT sn.id,
       sn.title,
       sn.approval_date,
       sn.category_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       sn.initial_page,
       sn.issn,
       sn.journal_id,
       j.name AS journal_name,
       sn.journal_title,
       sn.number_of_pages,
       sn.observation,
       sn.publication_date,
       sn.url,
       sn.volume,
       sn.active,
       sn.created_by,
       sn.updated_by,
       sn.created_at,
       sn.updated_at
FROM scientific_notes sn
INNER JOIN categories c on sn.category_id = c.id
INNER JOIN geo_cities gcity on sn.geo_city_id = gcity.id
INNER JOIN geo_states gs on gcity.geo_state_id = gs.id
INNER JOIN geo_countries gctry on gs.geo_country_id = gctry.id
INNER JOIN journals j on sn.journal_id = j.id;