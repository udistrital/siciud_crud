SELECT iplb.id,
       iplb.name,
       iplb.category_id,
       c.name AS category_name,
       iplb.certificate_ma_document,
       iplb.consecutive_number_ma,
       iplb.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       iplb.ip_livestock_breed_document,
       iplb.observation,
       iplb.publication_date,
       iplb.active,
       iplb.created_by,
       iplb.updated_by,
       iplb.created_at,
       iplb.updated_at
FROM ip_livestock_breeds iplb
INNER JOIN categories c on iplb.category_id = c.id
INNER JOIN geo_cities gcity on iplb.geo_city_id = gcity.id
INNER JOIN geo_states gs on gcity.geo_state_id = gs.id
INNER JOIN geo_countries gctry on gs.geo_country_id = gctry.id;